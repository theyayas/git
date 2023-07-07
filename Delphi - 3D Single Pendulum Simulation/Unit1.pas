unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, opengl,
  Vcl.Buttons, VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series,
  VCLTee.TeeProcs, VCLTee.Chart;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Timer1: TTimer;
    Timer2: TTimer;
    ScrollBar1: TScrollBar;
    Label3: TLabel;
    ScrollBar2: TScrollBar;
    Label4: TLabel;
    ScrollBar3: TScrollBar;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    GroupBox2: TGroupBox;
    Chart1: TChart;
    Series1: TLineSeries;
    Chart2: TChart;
    Series2: TLineSeries;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure rungekutta;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure ScrollBar3Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private-Deklarationen }
   myDC : HDC;
   myRC : HGLRC;
   myPalette : HPALETTE;
   procedure SetupPixelFormat;
  public
    { Public declarations }
  end;

const
mat_specular : array [0..3] of GLfloat = ( 8.0, 8.0, 1.0, 0.0 );
  mat_shininess : GLfloat = 40.0;
  light_position : array [0..3] of GLfloat = ( 120.6, 14.0, 41.0, 10.7 );
m = 10;
l = 5;
g = 9.8;
h = 0.005; hp = 0.05;

var
  Form1: TForm1;
  teta, phi,rotangle,phiangle : extended;
  k1t,k2t,k3t,k4t,k1p,k2p,k3p,k4p,dt : extended;
  tetadot,tetadotdot,phidot,phidotdot : extended;
  Sphere,cylinder,disk: GLUquadricObj;
  xpos,ypos,zpos:real;

implementation

{$R *.dfm}

procedure glBindTexture(target: GLenum; texture: GLuint); stdcall; external opengl32;
procedure TForm1.SetupPixelFormat;
var    hHeap: THandle;
  nColors, i: Integer;
  lpPalette : PLogPalette;
  byRedMask, byGreenMask, byBlueMask: Byte;
  nPixelFormat: Integer;
  pfd: TPixelFormatDescriptor;
begin
  FillChar(pfd, SizeOf(pfd), 0);
  with pfd do begin
    nSize     := sizeof(pfd);               // L�nge der pfd-Struktur
    nVersion  := 1;                         // Version
    dwFlags   := PFD_DRAW_TO_WINDOW or PFD_SUPPORT_OPENGL or
                 PFD_DOUBLEBUFFER;          // Flags
    iPixelType:= PFD_TYPE_RGBA;             // RGBA Pixel Type
    cColorBits:= 32;                        // 24-bit color
    cDepthBits:= 32;                        // 32-bit depth buffer
    iLayerType:= PFD_MAIN_PLANE;            // Layer Type
  end;
  nPixelFormat:= ChoosePixelFormat(myDC, @pfd);
  SetPixelFormat(myDC, nPixelFormat, @pfd);
                                            // Farbpalettenoptimierung wenn erforderlich
  DescribePixelFormat(myDC, nPixelFormat,
                      sizeof(TPixelFormatDescriptor),pfd);
  if ((pfd.dwFlags and PFD_NEED_PALETTE) <> 0) then begin
    nColors  := 1 shl pfd.cColorBits;
    hHeap    := GetProcessHeap;
    lpPalette:= HeapAlloc
       (hHeap,0,sizeof(TLogPalette)+(nColors*sizeof(TPaletteEntry)));
    lpPalette^.palVersion := $300;
    lpPalette^.palNumEntries := nColors;
    byRedMask  := (1 shl pfd.cRedBits) - 1;
    byGreenMask:= (1 shl pfd.cGreenBits) - 1;
    byBlueMask := (1 shl pfd.cBlueBits) - 1;
   for i := 0 to nColors - 1 do begin
      lpPalette^.palPalEntry[i].peRed  :=
        (((i shr pfd.cRedShift)  and byRedMask)  *255)DIV byRedMask;
      lpPalette^.palPalEntry[i].peGreen:=
        (((i shr pfd.cGreenShift)and byGreenMask)*255)DIV byGreenMask;
      lpPalette^.palPalEntry[i].peBlue :=
        (((i shr pfd.cBlueShift) and byBlueMask) *255)DIV byBlueMask;
      lpPalette^.palPalEntry[i].peFlags:= 0;
    end;
    myPalette:= CreatePalette(lpPalette^);
    HeapFree(hHeap, 0, lpPalette);
    if (myPalette <> 0) then begin
      SelectPalette(myDC, myPalette, False);
      RealizePalette(myDC);
    end;
  end;
end;


procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
series2.Clear; series1.Clear;
  if button1.Caption='START' then
  begin
    button1.Caption:='STOP';
    teta := (strtofloat(edit2.Text)+0.000000000001)*pi/180;
    phi := strtofloat(edit1.Text)*pi/180;

    timer2.Enabled:=true;
  end
  else if button1.Caption='STOP' then
  begin
    button1.Caption:='START';
    timer2.Enabled:=false;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
    rotangle:=rotangle+1;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
wglmakecurrent(0,0);
wgldeletecontext(mydc);
releasedc(handle,mydc);
end;

procedure TForm1.FormResize(Sender: TObject);
begin
glViewport(0, 0, Width, Height);    // Setzt den Viewport f�r das OpenGL Fenster
glMatrixMode(GL_PROJECTION);        // Matrix Mode auf Projection setzen
glLoadIdentity();                   // Reset View
gluPerspective(45.0, Width/Height, 1, 100.0);  // Perspektive den neuen Ma�en anpassen.
glMatrixMode(GL_MODELVIEW);         // Zur�ck zur Modelview Matrix
glLoadIdentity();
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
form1.myDC:= GetDC(Handle);
SetupPixelFormat;
myRC:= wglCreateContext(myDC);
wglMakeCurrent(myDC, myRC);
glEnable(GL_DEPTH_TEST);
glLoadIdentity;

  glClearColor(0.0, 0.0, 0.0, 1.0); 	   // Black Background
  glShadeModel(GL_SMOOTH);                 // Enables Smooth Color Shading
  glClearDepth(1.0);                       // Depth Buffer Setup
  glEnable(GL_DEPTH_TEST);                 // Enable Depth Buffer
  glDepthFunc(GL_LESS);		           // The Type Of Depth Test To Do

  glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);   //Realy Nice perspective calculations

  glEnable(GL_TEXTURE_2D);

  Sphere := gluNewQuadric();
  cylinder:= gluNewQuadric();
  disk:=glunewquadric();
  gluQuadricNormals(Sphere, GLU_SMOOTH);   // Create Smooth Normals
  gluQuadricNormals(cylinder, GLU_SMOOTH);   // Create Smooth Normals
  gluQuadricNormals(disk, GLU_SMOOTH);   // Create Smooth Normals

  glMaterialfv(GL_FRONT, GL_SPECULAR, @mat_specular);
  glMaterialfv(GL_BACK, GL_SPECULAR, @mat_specular);
  glMaterialfv(GL_FRONT, GL_SHININESS, @mat_shininess);
  glMaterialfv(GL_BACK, GL_SHININESS, @mat_shininess);
  glLightfv(GL_LIGHT0, GL_POSITION, @light_position);
  glLightfv(GL_LIGHT3, GL_SPECULAR, @mat_specular);
  glLightfv(GL_LIGHT1, GL_POSITION, @light_position);
  glLightfv(GL_LIGHT2, GL_POSITION, @light_position);

  glEnable(GL_LIGHTING);
  glEnable(GL_LIGHT0);
  glEnable(GL_LIGHT1);
  glEnable(GL_LIGHT2);
  glEnable(GL_LIGHT3);
  glDepthFunc(GL_LEQUAL);

rotangle:=0;
xpos:=scrollbar1.Position;
ypos:=scrollbar2.Position;
zpos:=scrollbar3.Position;
end;

//Mencari Runge-Kutta
procedure Tform1.rungekutta;
var
  kt1,kt2,kt3,kt4,kp1,kp2,kp3,kp4 : extended;
begin
  kt1 := h/2*(l/4)*(sqr(phidot)*sin(2*teta)) - g*sin(teta)/(7*l/6);
  kt2 := h/2*((l/4)*(sqr(phidot)*sin(2*(teta + h/2*(tetadot+kt1/2))) - g*sin(teta + h/2*(tetadot+kt1/2)))/(7*l/6));//h/2*((l/4)*(sqr(phidot)*sin(2*(teta + (h/2*(tetadot+(k1/2))))) - g*sin(teta + (h/2*(tetadot+(k1/2)))))/(7/6)*l) ;
  kt3 := h/2*((l/4)*(sqr(phidot)*sin(2*(teta + h/2*(tetadot+kt1/2))) - g*sin(teta + h/2*(tetadot+kt1/2)))/(7*l/6));//h/2*((l/4)*(sqr(phidot)*sin(2*(teta + h/2*(tetadot+k1/2))) - g*sin(teta + (h/2*(tetadot+(k1/2)))))/(7/6)*l);
  kt4 := h/2*((l/4)*(sqr(phidot)*sin(2*(teta + h*(tetadot+kt3))) - g*sin((teta + h*(tetadot+kt3))))/(7*l/6));//h/2*((l/4)*(sqr(phidot)*sin(2*(teta + (h*(tetadot+k3)))) - g*sin(teta + (h*(tetadot+k3)))/(7/6)*l));

  teta := teta + h*(tetadot + (kt1+kt2+kt3)/3);
  tetadot := tetadot + ((kt1+(2*kt2)+(2*kt3)+kt4)/6);

  kp1 := hp/2*(-2*phi*teta*cos(teta)/sin(teta));
  kp2 := hp/2*(-2*(phi+(hp/2*(phidot+kp1/2)))*teta*cos(teta)/sin(teta));
  kp3 := hp/2*(-2*(phi+(hp/2*(phidot+kp1/2)))*teta*cos(teta)/sin(teta));
  kp4 := hp/2*(-2*(phi+(hp*(phidot+kp3)))*teta*cos(teta)/sin(teta));

  phi := phi + hp*(phidot +((kp1+kp2+kp3+kp4)/3));
  phidot := phidot +((kp1+(2*kp2)+(2*kp3)+kp4)/6);
end;

procedure render;
var
  i:integer;
begin
glClearColor(0.0, 0.0, 0.0, 1.0);
glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT); //Farb und Tiefenpuffer l�schen
glLoadIdentity;

 {rotating cube}

 gltranslate(xpos,ypos,zpos);
 glrotate(rotangle,0,0,1);

 glrotate(90,1,0,0);
 glrotate(phiangle,1,0,0);
 gluCylinder(cylinder, 0.1, 0.1, 5, 32, 32);
 gltranslate(0,0,5);
 gluSphere(Sphere,0.8,20,20);
 glrotate(0,0,1,0);
 gluCylinder(cylinder, 0.1, 0.1, 5, 32, 32);

swapBuffers(form1.myDC);
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
  xpos:=scrollbar1.Position;
  label3.Caption:='X Possition = '+floattostr(xpos);
  render
end;

procedure TForm1.ScrollBar2Change(Sender: TObject);
begin
  ypos:=scrollbar2.Position;
  label4.Caption:='Y Position = '+floattostr(ypos);
  {if radiobutton1.Checked = true then
  begin
    renderdiri;
  end
  else if radiobutton2.Checked = true then
  begin
    renderduduk;
  end;}
  render
end;

procedure TForm1.ScrollBar3Change(Sender: TObject);
begin
  zpos:=scrollbar3.Position;
  label5.Caption:='Z Position = '+floattostr(zpos);
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  rungekutta;
  rotangle :=teta*180/pi;
  phiangle :=phi*180/pi;
  series1.AddY(rotangle);
  series2.AddY(phiangle);
  render
end;

end.
