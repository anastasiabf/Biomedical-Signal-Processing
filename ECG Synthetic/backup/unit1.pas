unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, TAGraph,
  TASeries,Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    Chart2: TChart;
    Chart2LineSeries1: TLineSeries;
    Chart3: TChart;
    Chart3LineSeries1: TLineSeries;
    Chart3LineSeries2: TLineSeries;
    Chart4: TChart;
    Chart4LineSeries1: TLineSeries;
    Chart4LineSeries2: TLineSeries;
    Chart5: TChart;
    Chart5LineSeries1: TLineSeries;
    Chart5LineSeries2: TLineSeries;
    Chart5LineSeries3: TLineSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit2: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure CheckBox3Change(Sender: TObject);
    procedure CheckBox4Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ECGNORMAL;
    procedure atrial_flutter;
    procedure rungekutta;
    function dynamicalX (t0:Real; x0:Real; y0:Real) : real;
    function dynamicalY (t0:Real; x0:Real; y0:Real) : real;
    function dynamicalZ (t0:Real; x0:Real; y0:Real; z0:Real) : real;
    function omega (input :Real) : real;
    function modulus (input1 : real; input2: Real) :real;
    function atan2(y:Real;x:Real):Real;
  private

  public

  end;

const
  fsint=512;

var
  Form1: TForm1;
  f1,f2,c1,c2,hmean,hstd,tau1,tau2,rasio,m,m1,f,offset,c : real;
  S,sm,IDFT2,idftk,IDFT_imj,rex,imj,RR, ph, ph2, re, im,magx,freq : array[0..100000]of real;
  ndata, hrm, hrstd, scale,fsecg,jumlah: Integer;
  IDFT1, IDFT : array[0..100000] of Extended;
  x, y, z: array[0..100000] of Extended;
  ai, bi, ti : array[1..5] of real;
  modulation_factor : Extended;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var n, i, j : integer;
begin
  Chart1LineSeries1.Clear;
  Chart2LineSeries1.Clear;
  Chart3LineSeries1.Clear;
  Chart3LineSeries2.Clear;
  Chart4LineSeries1.Clear;
  Chart4LineSeries2.Clear;
  f1 := 0.1; Edit1.Text:= FloatToStr(f1);        //low frequency
  f2 := 0.25 ; Edit2.Text:= FloatToStr(f2);      //high frequency
  c1 := 0.01 ; Edit3.Text:= FloatToStr(c1);      //standev low freq
  c2 := 0.01 ; Edit4.Text:= FloatToStr(c2);      //standev high freq
  tau1 := 0.06 ;
  //tau2 := 0.079 ;
  rasio := 0.5;         Edit5.Text:= FloatToStr(rasio);
  tau2 := sqrt(sqr(tau1)/rasio);
  ndata := StrToInt(Edit6.Text);
  hrm := StrToInt(Edit7.Text);
  scale:= StrToInt(Edit8.Text);
  //fsint:=512; Edit24.Text:=floattostr(fsint);
  offset:= 60/hrm; Edit27.Text:=FloatToStr(offset);

//Mayer RSA Waves
  for i:=0 to ndata-1 do
    begin
      f := i/ndata;
     S[i] := (((Sqr(tau1))/Sqrt(2*pi*Sqr(c1)))*Exp(-(Sqr(f-f1))/(2*Sqr(c1))))+
     (((Sqr(tau2))/Sqrt(2*pi*Sqr(c2)))*Exp(-(Sqr(f-f2))/(2*Sqr(c2)))) ;
     Chart1LineSeries1.AddXY(f,S[i]);
    end;

//mirroring
   for i:=0 to Round(ndata/2)do
    begin
      m := i/ndata;
      sm[i] := Sqrt(S[i]);
      Chart2LineSeries1.AddXY(m,sm[i]);
    end;
     for i:= Round (ndata/2)+1 to ndata do
    begin
      m := 1-(i/ndata);
      m1 := i/ndata;
      sm[i] :=(Sqrt(Sqr(tau1)/Sqrt(2*pi*Sqr(c1))*Exp(-(Sqr(m-f1)/(2*Sqr(c1))))))+
      (Sqrt(Sqr(tau2)/Sqrt(2*pi*Sqr(c2))*Exp(-(Sqr(m-f2)/(2*Sqr(c2))))));
      Chart2LineSeries1.AddXY(m1,sm[i]);
    end;

//random phase
for i := 1 to round((ndata/2)-1) do
    begin
    ph[i]:=2*pi*i*random;
    end;
     ph2[1] := 0;
     for i := 1 to round((ndata/2)-1) do
     begin
     ph2[i+1] := ph[i];
     end;
     ph2[round((ndata/2)+1)] := 0;
      for i := 1 to round((ndata/2)-1) do
          begin
          ph2[round(ndata)-i+1] := -ph[i];
          end;
  for i := 1 to ndata do
    begin
      re[i]:= sm[i]*cos(ph2[i]);
      im[i]:= sm[i]*sin(ph2[i]);
     Chart3LineSeries1.AddXY(i/ndata,re[i]);
     Chart3LineSeries2.AddXY(i/ndata,im[i]);
    end;

//RR Tachogram time series
     for n:=0 to ndata-1 do
       begin
         rex[n] := 0;
         imj[n] := 0;
         for j:=0 to ndata-1 do
           begin
             rex[n]:= rex[n] + (re[j]*(cos((2*n*pi*j)/ndata)));
             imj[n]:= imj[n] + (im[j]*(sin((2*n*pi*j)/ndata)));
             magx[n]:= sqrt(Power(rex[n],2)+ Power(imj[n],2));
             idft[n]:=(rex[n]+imj[n])/ndata
           end;
         Chart4LineSeries1.AddXY(n,idft[n]);
       end;

//scaling
     for n:=0 to ndata-1 do
       begin
         idft[n]:= idft[n]*Scale+(60/hrm);
         Chart4LineSeries2.AddXY(n,idft[n]);
       end;
end;

//omega
function TForm1.omega (input : real) : real;
var
  i : integer;
begin
  i := Floor(input/fsecg);
  omega := 2*pi/(idft[i]);
end;

//x dot
function TForm1.dynamicalX (t0:Real; x0:Real; y0:Real) : real;
var
  alfa : Extended;
  begin
    alfa := 1-sqrt(Sqr(x0) + Sqr(y0));
    dynamicalX := alfa*x0 - omega(t0)*y0;
  end;

//y dot
function TForm1.dynamicalY (t0:Real; x0:Real; y0:Real) : Real;
var
  alfa : Extended;
  begin
    alfa := 1-sqrt(Sqr(x0) + Sqr(y0));
    dynamicalY := alfa*y0 + omega(t0)*x0;
  end;

//z dot
function TForm1.dynamicalZ (t0:Real; x0:Real; y0:Real; z0: Real) : Real;
var
  sum, te, zawal : real;
  delta, delta2 : array[1..5] of real;
  i : Integer;
  begin
    sum := 0;
    zawal := 0.1*sin(2*pi*t0*f2); //baseline wander
    te := atan2(y0,x0);
    for i:= 1 to 5 do
    begin
      delta[i] := modulus(te-ti[i],2*pi)-pi;
      delta2[i] := delta[i]*delta[i];
      sum := sum + -ai[i]*delta[i]*exp(-0.5*delta2[i]/(bi[i]*bi[i]));
    end;
    sum := sum - 1*(z0 - zawal);
    dynamicalZ := sum;
  end;

function TForm1.modulus (input1 : real; input2: Real) :real;
begin
  if abs (input1)<(input2) then
  begin
    if input1<0 then result := input1+input2
    else if input1>0 then result := input1
    else if input1=0 then result:=0;
  end
  else if input1>0 then
  begin
    while input1>input2 do input1:= input1-input2;
    result := input1;
  end;
end;

function TForm1.atan2(y:Real;x:Real):Real;
begin
  atan2:=2*(arctan(y/(Sqrt(Sqr(x)+sqr(y))+x)));
end;

procedure TForm1.ECGNORMAL;
var
  i : Integer;
begin
  modulation_factor := sqrt(hrm/60);
  //INPUT Teta//
  ti[1] := -60*(Sqrt(modulation_factor));
  ti[2] := -15*modulation_factor;
  ti[3] := 0;
  ti[4] := 15*modulation_factor;
  ti[5] := 90*(Sqrt(modulation_factor));

  //INPUT ai//
  ai[1]:= 0.8;
  ai[2]:= -5;
  ai[3] := 30;
  ai[4] := -7.5;
  ai[5] := 0.75*power(modulation_factor, 2.5);

  //INPUT bi//
  bi[1] := 0.2*modulation_factor;
  bi[2] := 0.1*modulation_factor;
  bi[3] := 0.1*modulation_factor;
  bi[4] := 0.1*modulation_factor;
  bi[5] := 0.4*power(modulation_factor, -1);

    edit9.Text:=FloatToStr(ti[1]);
    edit10.Text:=FloatToStr(ai[1]);
    edit11.Text:=FloatToStr(bi[1]);
    edit12.Text:=FloatToStr(ti[2]);
    edit13.Text:=FloatToStr(ai[2]);
    edit14.Text:=FloatToStr(bi[2]);
    edit15.Text:=FloatToStr(ti[3]);
    edit16.Text:=FloatToStr(ai[3]);
    edit17.Text:=FloatToStr(bi[3]);
    edit18.Text:=FloatToStr(ti[4]);
    edit19.Text:=FloatToStr(ai[4]);
    edit20.Text:=FloatToStr(bi[4]);
    edit21.Text:=FloatToStr(ti[5]);
    edit22.Text:=FloatToStr(ai[5]);
    edit23.Text:=FloatToStr(bi[5]);

     for i := 1 to 5 do
 begin
  ti[i]:=ti[i]*pi/180; //mengubah ke radian
 end;
end;

procedure TForm1.atrial_flutter;
var
  i : Integer;
begin
  modulation_factor := sqrt(hrm/60);
  //INPUT Teta
  ti[1] := -135*(Sqrt(modulation_factor));
  ti[2] := -45*modulation_factor;
  ti[3] := 0;
  ti[4] := 60*modulation_factor;
  ti[5] := 135*(Sqrt(modulation_factor));

  //INPUT ai
  ai[1]:= 0.5;
  ai[2]:= 0.5;
  ai[3] := 30;
  ai[4] := 0.5;
  ai[5] := 0.5*power(modulation_factor, 2.5);

  //INPUT bi
  bi[1] := 0.3*modulation_factor;
  bi[2] := 0.3*modulation_factor;
  bi[3] := 0.1*modulation_factor;
  bi[4] := 0.3*modulation_factor;
  bi[5] := 0.3*power(modulation_factor, -1);

    edit9.Text:=FloatToStr(ti[1]);
    edit10.Text:=FloatToStr(ai[1]);
    edit11.Text:=FloatToStr(bi[1]);
    edit12.Text:=FloatToStr(ti[2]);
    edit13.Text:=FloatToStr(ai[2]);
    edit14.Text:=FloatToStr(bi[2]);
    edit15.Text:=FloatToStr(ti[3]);
    edit16.Text:=FloatToStr(ai[3]);
    edit17.Text:=FloatToStr(bi[3]);
    edit18.Text:=FloatToStr(ti[4]);
    edit19.Text:=FloatToStr(ai[4]);
    edit20.Text:=FloatToStr(bi[4]);
    edit21.Text:=FloatToStr(ti[5]);
    edit22.Text:=FloatToStr(ai[5]);
    edit23.Text:=FloatToStr(bi[5]);

     for i := 1 to 5 do
 begin
  ti[i]:=ti[i]*pi/180; //mengubah ke radian
 end;
end;

procedure TForm1.rungekutta;
var
  time : real;
  k1x, k1y, k1z, k2x, k2y, k2z, k3x, k3y, k3z, k4x, k4y, k4z, h : real;
  i : integer;
begin
  Chart5LineSeries1.Clear;
  Chart5LineSeries2.Clear;
  Chart5LineSeries3.Clear;
  //initial condition
  x[0]:=0.1;
  y[0]:=0.0;
  z[0]:=0.0;
  time:=0.0;
  fsecg:= StrToInt(Edit25.Text);
  h:= 1/fsecg;                       //step size

  jumlah:= strtoint(edit26.text)*fsecg;
  c:=strtoint(Edit26.text);

  if RadioButton1.Checked=true then
  begin
  //Start plot ECG
  ECGNORMAL;
    for i:= 0 to jumlah do
    begin
      k1x:= dynamicalX(time,x[i],y[i]);
      k1y:= dynamicalY(time,x[i],y[i]);
      k1z:= dynamicalZ(time,x[i],y[i],z[i]);

      k2x:= dynamicalX(time, x[i]+0.5*h, y[i]+0.5*k1y*h);
      k2y:= dynamicalY(time, x[i]+0.5*h, y[i]+0.5*k1y*h);
      k2z:= dynamicalZ(time, x[i]+0.5*h, y[i]+0.5*k1y*h,z[i]+0.5*k1z*h);

      k3x:= dynamicalX(time, x[i]+0.5*h, y[i]+0.5*k2y*h);
      k3y:= dynamicalY(time, x[i]+0.5*h, y[i]+0.5*k2y*h);
      k3z:= dynamicalZ(time, x[i]+0.5*h, y[i]+0.5*k2y*h,z[i]+0.5*k2z*h);

      k4x:= dynamicalX(time,x[i]+h,y[i]+k3y*h);
      k4y:= dynamicalY(time,x[i]+h,y[i]+k3y*h);
      k4z:= dynamicalZ(time,x[i]+h,y[i]+k3y*h,z[i]+k3z*h);

      x[i+1] := x[i] + (h/6)*(k1x+2*k2x+2*k3x+k4x);
      y[i+1] := y[i] + (h/6)*(k1y+2*k2y+2*k3y+k4y);
      z[i+1] := z[i] + (h/6)*(k1z+2*k2z+2*k3z+k4z);
      Chart5LineSeries1.AddXY(i/fsecg, z[i]);
    end;
  end;

  if RadioButton2.checked=true then
  begin
  atrial_flutter;
  for i:= 0 to jumlah do
    begin
      k1x:= dynamicalX(time,x[i],y[i]);
      k1y:= dynamicalY(time,x[i],y[i]);
      k1z:= dynamicalZ(time,x[i],y[i],z[i]);

      k2x:= dynamicalX(time, x[i]+0.5*h, y[i]+0.5*k1y*h);
      k2y:= dynamicalY(time, x[i]+0.5*h, y[i]+0.5*k1y*h);
      k2z:= dynamicalZ(time, x[i]+0.5*h, y[i]+0.5*k1y*h,z[i]+0.5*k1z*h);

      k3x:= dynamicalX(time, x[i]+0.5*h, y[i]+0.5*k2y*h);
      k3y:= dynamicalY(time, x[i]+0.5*h, y[i]+0.5*k2y*h);
      k3z:= dynamicalZ(time, x[i]+0.5*h, y[i]+0.5*k2y*h,z[i]+0.5*k2z*h);

      k4x:= dynamicalX(time,x[i]+h,y[i]+k3y*h);
      k4y:= dynamicalY(time,x[i]+h,y[i]+k3y*h);
      k4z:= dynamicalZ(time,x[i]+h,y[i]+k3y*h,z[i]+k3z*h);

      x[i+1] := x[i] + (h/6)*(k1x+2*k2x+2*k3x+k4x);
      y[i+1] := y[i] + (h/6)*(k1y+2*k2y+2*k3y+k4y);
      z[i+1] := z[i] + (h/6)*(k1z+2*k2z+2*k3z+k4z);
      Chart5LineSeries1.AddXY(i/fsecg, z[i]);
    end;
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Chart1LineSeries1.Clear;
  Chart2LineSeries1.Clear;
  Chart3LineSeries1.Clear;
  Chart3LineSeries2.Clear;
  Chart4LineSeries1.Clear;
  Chart4LineSeries2.Clear;
  Chart5LineSeries1.Clear;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  rungekutta;
end;

procedure TForm1.CheckBox1Change(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    Chart3LineSeries1.Active:=True
  end
  else
  begin
  Chart3LineSeries1.Active:=False;
  end;
end;

procedure TForm1.CheckBox2Change(Sender: TObject);
begin
   if CheckBox2.Checked then
  begin
    Chart3LineSeries2.Active:=True
  end
  else
  begin
  Chart3LineSeries2.Active:=False;
  end;
end;

procedure TForm1.CheckBox3Change(Sender: TObject);
begin
  if CheckBox3.Checked then
  begin
    Chart4LineSeries1.Active:=True
  end
  else
  begin
  Chart4LineSeries1.Active:=False;
  end;
end;

procedure TForm1.CheckBox4Change(Sender: TObject);
begin
  if CheckBox4.Checked then
  begin
    Chart4LineSeries2.Active:=True
  end
  else
  begin
  Chart4LineSeries2.Active:=False;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;


end.

