unit tugaspsb;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, ExtCtrls,
  StdCtrls, ActnList, ComCtrls, TAGraph, TASeries, Math, Types;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button14: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Chart1: TChart;
    Chart10: TChart;
    Chart10LineSeries1: TLineSeries;
    Chart10LineSeries2: TLineSeries;
    Chart11: TChart;
    Chart11LineSeries1: TLineSeries;
    Chart11LineSeries2: TLineSeries;
    Chart11LineSeries3: TLineSeries;
    Chart1LineSeries1: TLineSeries;
    Chart2: TChart;
    Chart2LineSeries1: TLineSeries;
    Chart3: TChart;
    Chart3LineSeries1: TLineSeries;
    Chart3LineSeries2: TLineSeries;
    Chart3LineSeries3: TLineSeries;
    Chart3LineSeries4: TLineSeries;
    Chart3LineSeries5: TLineSeries;
    Chart4: TChart;
    Chart4LineSeries1: TLineSeries;
    Chart4LineSeries2: TLineSeries;
    Chart4LineSeries3: TLineSeries;
    Chart5: TChart;
    Chart5LineSeries1: TLineSeries;
    Chart5LineSeries2: TLineSeries;
    Chart5LineSeries3: TLineSeries;
    Chart6: TChart;
    Chart6LineSeries1: TLineSeries;
    Chart7: TChart;
    Chart7LineSeries1: TLineSeries;
    Chart8: TChart;
    Chart8LineSeries1: TLineSeries;
    Chart9: TChart;
    Chart9LineSeries1: TLineSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    ScrollBar1: TScrollBar;
    ScrollBar10: TScrollBar;
    ScrollBar11: TScrollBar;
    ScrollBar12: TScrollBar;
    ScrollBar13: TScrollBar;
    ScrollBar14: TScrollBar;
    ScrollBar2: TScrollBar;
    ScrollBar3: TScrollBar;
    ScrollBar9: TScrollBar;
    StringGrid1: TStringGrid;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure CheckBox3Change(Sender: TObject);
    procedure CheckBox4Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label22Click(Sender: TObject);
    procedure Label23Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure plot_ecg;
    procedure RadioGroup1Click(Sender: TObject);
    procedure ScrollBar10Change(Sender: TObject);
    procedure ScrollBar11Change(Sender: TObject);
    procedure ScrollBar12Change(Sender: TObject);
    procedure ScrollBar13Change(Sender: TObject);
    procedure ScrollBar14Change(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure ScrollBar3Change(Sender: TObject);
    procedure ScrollBar9Change(Sender: TObject);
    procedure TabSheet1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure TabSheet2ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    //procedure RadioGroup1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  d : TextFile;
  j, n1,ecg_lead,fs,fc,fl,y1,yy1,yh,der1,der3,der4: Integer;
  rP1,rP2,rQRS1,rQRS2,rT1,rT2,M, M1,M2,range1,range2,range3,range4: Integer;
  temp:real;
  T,temp2,avrg,std,std2,r,c,z,v:extended;
  sequence, I, II, III, AVR, A, AVL, AVF : array [0..20000] of Extended;
  V1, V2, V3, V4, V5, V6 : array [0..20000] of Extended;
  //hmav: array [0..100000] of Extended;
  min,max,w1,w2,mav1,mav22:extended;
  ECG_12lead : array [1..12,0..20000] of Extended;
  //sinyal_ecg:array [0..200000] of Extended;
  ReX,ImX,DFT:array[0..10000] of real;
  w, hw : array [-100000..100000] of double;
  LPF,LPFB, HPF, sinyal_ecg,hmav,derresult,sqrres,mav2,mav3,thresholdQRS,interval,BPM,peakmax: array [-10000..10000] of extended;
implementation

{$R *.lfm}

{ TForm1 }
//--------------------------------Pre Processing--------------------------------
//input data
procedure TForm1.Button1Click(Sender: TObject);
begin
 j:=0;
 fs:=1000;
 Edit1.Text:=IntToStr(fs);
    StringGrid1.RowCount:= 10000;            //membuat baris sesuai jumlah data
    StringGrid1.ColCount:= 13;               //membuat kolom sesuai jumlah data
    AssignFile(d, 'ecg12data.txt');
    reset(d);
    ReadLn(d);
    ReadLn(d);
    while not EOF(d) do
    begin
    ReadLn(d,sequence[j],I[j],II[j],III[j],AVR[j],
    AVL[j],AVF[j],V1[j],V2[j],V3[j],V4[j],V5[j],V6[j]);
    ECG_12lead[1,j] := I[j];
    ECG_12lead[2,j] := II[j];
    ECG_12lead[3,j] := III[j];
    ECG_12lead[4,j] := AVR[j];
    ECG_12lead[5,j] := AVL[j];
    ECG_12lead[6,j] := AVF[j];
    ECG_12lead[7,j] := V1[j];
    ECG_12lead[8,j] := V2[j];
    ECG_12lead[9,j] := V3[j];
    ECG_12lead[10,j] := V4[j];
    ECG_12lead[11,j] := V5[j];
    ECG_12lead[12,j] := V6[j];
    StringGrid1.Cells[0,j] := FloatToStr(sequence[j]);
    StringGrid1.Cells[1,j] := FloatToStr(I[j]);
    StringGrid1.Cells[2,j] := FloatToStr(II[j]);
    StringGrid1.Cells[3,j] := FloatToStr(III[j]);
    StringGrid1.Cells[4,j] := FloatToStr(AVR[j]);
    StringGrid1.Cells[5,j] := FloatToStr(AVL[j]);
    StringGrid1.Cells[6,j] := FloatToStr(AVF[j]);
    StringGrid1.Cells[7,j] := FloatToStr(V1[j]);
    StringGrid1.Cells[8,j] := FloatToStr(V2[j]);
    StringGrid1.Cells[9,j] := FloatToStr(V3[j]);
    StringGrid1.Cells[10,j] := FloatToStr(V4[j]);
    StringGrid1.Cells[11,j] := FloatToStr(V5[j]);
    StringGrid1.Cells[12,j] := FloatToStr(V6[j]);
    j:=j+1
    end;
    n1:=j;
    edit14.Text:=IntToStr(n1);
    CloseFile(d);
  end;


//Plot ECG Signal
procedure TForm1.plot_ecg;
var i,j : Integer;
begin
  fs:=1000;
  Button1.Enabled := True;
  Chart1LineSeries1.Clear;
  min := 0;
  max := 0;
  for j := 0 to 11 do
  begin
    if ComboBox1.ItemIndex = j then
    begin
      ECG_Lead := (j+1);
      for i := 0 to n1-1 do
      begin
        sinyal_ecg[i] := ECG_12lead[ECG_Lead,i];
        if sinyal_ecg[i] < min then
        begin
          min := sinyal_ecg[i];
        end
        else if sinyal_ecg[i] > max then
        begin
          max := sinyal_ecg[i];
        end;
        Chart1LineSeries1.AddXY((i/fs),sinyal_ecg[i]);
      end;
    end
    else
    begin
      Continue;
    end;
  end;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin

end;

//Plot ECG Signal
procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  plot_ecg;
end;

procedure TForm1.Edit5Change(Sender: TObject);
begin

end;

procedure TForm1.Edit6Change(Sender: TObject);
begin

end;

//DFT ECG SIGNAL
procedure TForm1.Button2Click(Sender: TObject);
  var k, n : integer;
begin
  Chart2LineSeries1.Clear;
  for k := 0 to n1-1 do
   begin
     ReX[k]:=0;
     ImX[k]:=0;
     for n := 0 to n1-1 do
     begin
       ReX[k]:= ReX[k] + sinyal_ecg[n]*cos(2*pi*k*n/n1);
       ImX[k]:= ImX[k] - sinyal_ecg[n]*sin(2*pi*k*n/n1);
     end;
     DFT[k]:= Sqrt(power(ReX[k],2)+Power(ImX[k],2));
   end;
   for k:=0 to n1 div 2 do
   Chart2LineSeries1.AddXY((k*fs/n1),2*DFT[k]/n1);
end;

//MAV Pre process
procedure TForm1.Button3Click(Sender: TObject);
  var a,b : integer;
begin
  Chart3LineSeries1.Clear;
  //Start MAV ECG Signal
  M:=ScrollBar10.Position;
  Edit2.Text:=IntToStr(M);
  for a:=0 to (n1-1) do
    begin
      temp:=0;
      for b:=0 to M-1 do
      begin
        if (a-b)<0 then
        begin
        temp:=temp+(1/M*sinyal_ecg[0]);
        end
        else if (a-b)>0 then
        begin
        temp:=temp+(1/M*sinyal_ecg[a-b]);
        end;
      hmav[a]:=temp;
      end;
      end;
      for a:=0 to n1-1 do
      begin
      Chart3LineSeries1.AddXY(a/fs,hmav[a]);
     end;
  end;

//WINDOW SEGMENTATION P,QRS,T WAVES
procedure TForm1.Button4Click(Sender: TObject);
var i,k:integer;
begin
  Chart5LineSeries1.Clear;
  Chart5LineSeries2.Clear;
  Chart5LineSeries3.Clear;
  Chart4LineSeries1.Clear;
  Chart4LineSeries2.Clear;
  Chart4LineSeries3.Clear;
  fs:=1000;
  range1:=ScrollBar11.Position;
  range2:=ScrollBar12.Position;
  range3:=ScrollBar13.Position;
  range4:=ScrollBar14.Position;

  //P Wave
  for i := 0 to n1 do
  begin
        //Rectangular Window
        w[i] := 1;
        hw[i] := hmav[i] * w[i];

  if (i> range1) and (i< range2) then
  begin
   hw[i] := hmav[i] * w[i];
  end
  else
 hw[i] := 0;
    Chart4LineSeries1.AddXY(i/fs, hw[i]);
  end;

  //DFT P Wave
  for k := 0 to n1-1 do
   begin
     ReX[k]:=0;
     ImX[k]:=0;
     for i := 0 to n1-1 do
     begin
       ReX[k] := ReX[k] + (hw[i]*cos(2*pi*(k)*(i)/(n1)));
       ImX[k] := ImX[k] - (hw[i]*sin(2*pi*(k)*(i)/(n1)));
     end;
      DFT[k]:= Sqrt(Sqr(ReX[k])+Sqr(ImX[k]))/(n1);
   end;
   for k:=0 to n1 div 2 do
   Chart5LineSeries1.AddXY((k*fs/n1),DFT[k]);

   //QRS Wave
  for i := 0 to n1 do
  begin
  //Rectangular Window
  w[i] := 1;
  hw[i] := hmav[i] * w[i];
    if (i> range2) and (i< range3) then
  begin
   hw[i] := hmav[i] * w[i];
  end
  else
   hw[i] := 0;
    Chart4LineSeries2.AddXY(i/fs, hw[i]);
  end;

  //DFT QRS Wave
  for k := 0 to n1-1 do
   begin
     ReX[k]:=0;
     ImX[k]:=0;
     for i := 0 to n1-1 do
     begin
       ReX[k] := ReX[k] + (hw[i]*cos(2*pi*(k)*(i)/(n1)));
       ImX[k] := ImX[k] - (hw[i]*sin(2*pi*(k)*(i)/(n1)));
     end;
      DFT[k]:= Sqrt(Sqr(ReX[k])+Sqr(ImX[k]))/(n1);
   end;
   for k:=0 to n1 div 2 do
   Chart5LineSeries2.AddXY((k*fs/n1),DFT[k]);

  //T Wave
    for i := 0 to n1 do
    begin
        //Rectangular Window
        w[i] := 1;
        hw[i] := hmav[i] * w[i];
    if (i> range3) and (i< range4) then
  begin
   hw[i] := hmav[i] * w[i];
  end
  else
  hw[i] := 0;
    Chart4LineSeries3.AddXY(i/fs, hw[i]);
    end;

  //DFT T Wave
  for k :=0  to n1-1 do
   begin
     ReX[k]:=0;
     ImX[k]:=0;
     for i := 0 to n1-1 do
     begin
       ReX[k] := ReX[k] + (hw[i]*cos(2*pi*(k)*(i)/(n1)));
       ImX[k] := ImX[k] - (hw[i]*sin(2*pi*(k)*(i)/(n1)));
     end;
      DFT[k]:= Sqrt(Sqr(ReX[k])+Sqr(ImX[k]))/(n1);
   end;
   for k:=0 to n1 div 2 do
   Chart5LineSeries3.AddXY((k*fs/n1),DFT[k]);

end;

//----------------------Start QRS Detection Process-----------------------------
//LPF
procedure TForm1.Button7Click(Sender: TObject);
var i:integer;
begin
  Chart6LineSeries1.clear;
  T:=1/fs;
  fc:= ScrollBar1.Position;
  Edit3.text:=IntToStr(fc);
  w1:= 2*Pi*fc;
  for i:=0 to n1-1 do
  begin
  y1:=i-1;
  if y1<0 then
  begin
  lpf[i]:= (((2/T)-(w1))*lpf[0]+(w1*hmav[i])+(w1*hmav[0]))/((2/T)+w1);
  end
  else if y1>=0 then
  begin
  lpf[i]:= (((2/T)-(w1))*lpf[i-1]+(w1*hmav[i])+(w1*hmav[i-1]))/((2/T)+w1);
  end;
  end;
   for i:=0 to n1-1 do
 begin
    chart6lineseries1.addxy(i/fs,lpf[i]);
 end;
end;

//HPF
procedure TForm1.Button8Click(Sender: TObject);
var i:integer;
begin
  Chart7LineSeries1.clear;
 fl:= ScrollBar2.Position;
  Edit4.text:=IntToStr(fl);
  w2:=2*pi*fl;
 T:=1/fs;
 for i:=0 to n1-1 do
 begin
  y1:=i-1;
  yh:=i-2;
    if yh<0 then begin
     if y1<0 then begin
     hpf[i]:=(4*lpf[i]-8*lpf[0]+4*lpf[0]+(8-2*sqr(w2)*sqr(T))*hpf[0]-(4-2.828*(w2)*T+sqr(w2)*sqr(T))*hpf[0])/(4+2.828*(w2)*T+sqr(w2)*sqr(T));
     end;
     if y1>=0 then begin
      hpf[i]:=(4*lpf[i]-8*lpf[i-1]+4*lpf[0]+(8-2*sqr(w2)*sqr(T))*hpf[i-1]-(4-2.828*(w2)*T+sqr(w2)*sqr(T))*hpf[0])/(4+2.828*(w2)*T+sqr(w2)*sqr(T));
     end;
    end
    else if yh>=0 then begin
       hpf[i]:=(4*lpf[i]-8*lpf[i-1]+4*lpf[i-2]+(8-2*sqr((w2))*sqr(T))*hpf[i-1]-(4-2.828*(w2)*T+sqr((w2))*sqr(T))*hpf[i-2])/(4+2.828*(w2)*T+sqr((w2))*sqr(T));
     end;
 end;
 for i:=0 to n1-1 do
 begin
  chart7lineseries1.addxy(i/fs,hpf[i]);
end;
end;

//Derivative
procedure TForm1.Button9Click(Sender: TObject);
var i:integer;
begin
 chart8lineseries1.clear;
 //der1:=i-1;
 //der3:=i-3;
 //der4:=i-4;
 for i:=0 to n1-1 do
 begin
  {if der4<0 then
    begin
     if der3<0 then
     begin
     if der1<0 then
     begin
     derresult[i]:=((2*hpf[i])+hpf[0]-hpf[0]-(2*hpf[0]))/8;
     end
     else if der1>=0 then
     begin
     derresult[i]:=((2*hpf[i])+hpf[i-1]-hpf[0]-(2*hpf[0]))/8;
     end;
     end
     else if der3>=0 then
     begin
     derresult[i]:=((2*hpf[i])+hpf[i-1]-hpf[i-3]-(2*hpf[0]))/8;
     end;
    end
  else if der4>=0 then
    begin
      derresult[i]:=((2*hpf[i])+hpf[i-1]-hpf[i-3]-(2*hpf[i-4]))/8;
    end;           }
  derresult[i]:=(2*hpf[i]+hpf[i-1]-hpf[i-3]-2*hpf[i-4])/8;
 Chart8LineSeries1.addxy(i/fs,derresult[i]);
 end;
end;

//squaring
procedure TForm1.Button10Click(Sender: TObject);
var i:integer;
begin
  Chart9LineSeries1.clear;;
  for i:=0 to n1-1 do
  begin
  sqrres[i]:=sqr(derresult[i]);
  Chart9LineSeries1.addxy(i/fs, sqrres[i]);
  end;
end;

//MAV Result
procedure TForm1.Button11Click(Sender: TObject);
  var i,n:integer  ;
begin
 Chart10LineSeries1.Clear;
 Chart10LineSeries2.Clear;
 M1:=StrToInt(Edit7.Text); //forward
 M2:=StrToInt(Edit8.Text); //backward
for i:=0 to n1-1 do
begin
  mav1:=0;
  mav22:=0;
  for n:=0 to m1-1 do
  begin
   mav1:= mav1+sqrres[i-n];
   mav2[i]:=mav1/M1;
  end;

  //backward
  for n:=0 to m2-1 do
  begin
   mav22:=mav22+mav2[i+n];
  end;
  mav3[i]:= (mav22/m2);
  end;
  for i:=0 to n1-1 do
begin
  Chart10LineSeries1.addxy(i/fs,(mav3[i]));
  Chart10LineSeries2.addxy(i/fs, hmav[i]);
end;
end;

procedure TForm1.CheckBox1Change(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    Chart10LineSeries1.Active:=True
  end
  else
  begin
  Chart10LineSeries1.Active:=False;
  end;
end;

procedure TForm1.CheckBox2Change(Sender: TObject);
begin
  if CheckBox2.Checked then
  begin
    Chart10LineSeries2.Active:=True
  end
  else
  begin
  Chart10LineSeries2.Active:=False;
  end;
end;

procedure TForm1.CheckBox3Change(Sender: TObject);
begin
  if CheckBox3.Checked then
  begin
    Chart11LineSeries2.Active:=True
  end
  else
  begin
  Chart11LineSeries2.Active:=False;
  end;
end;

procedure TForm1.CheckBox4Change(Sender: TObject);
begin
  if CheckBox4.Checked then
  begin
    Chart11LineSeries3.Active:=True
  end
  else
  begin
  Chart11LineSeries3.Active:=False;
  end;
end;

//threshold&result
procedure TForm1.Button12Click(Sender: TObject);
var
  maksimum : extended;
  k,j,n : integer;
  threshold : real;
  s1,s2 : string;
begin
  button12.Enabled:=true;
  Edit6.clear;
  Chart11LineSeries1.clear;
  Chart11LineSeries2.clear;
  Chart11LineSeries3.clear;
  ListBox1.clear;
  ListBox2.clear;
  //Edit5.clear;
  j:=0;
  T:=1/fs;

  maksimum:=MaxValue(mav3);         //menentukan nilai max dari peak mav result
  threshold := maksimum*0.3;

  for k := 0 to n1-1 do
  begin
  if mav3[k] > threshold then
  begin
    thresholdQRS[k] := 1;
  end
  else
    thresholdQRS[k] := 0;
  chart11lineseries2.addxy(k/fs, sinyal_ecg[k]);
  chart11lineseries1.addxy(k/fs, thresholdQRS[k]);
  Chart11LineSeries3.AddXY(k/fs, (mav3[k]));
end;


//find BPM
 for k := 1 to n1 do
 begin
  if (thresholdQRS[k] = 1) and (thresholdQRS[k-1] = 0) then
  begin
    peakmax[j] := k;
    inc(j);
  end;
  end;
  temp2:=0;
  for k := 1 to j-1 do
 begin
   interval[k] := Abs((peakmax[k])- peakmax[k-1])* T ;
   BPM[k] := 60/interval[k];
   temp2 :=  temp2 + BPM[k];
   Str(BPM[k]:3:10, s1);
   Str(interval[k]:3:10, s2);

   ListBox1.Items.Add('RR interval [' + IntToStr(k) + ']= ' +s1) ;
   ListBox2.Items.Add(s2) ;
 end;
 avrg:=temp2/(j-1);
 Edit6.Text := floatToStr(avrg);

 {for k:=1 to j-1 do
 begin
   std:= 0;
   for n:=1 to j-1 do
   begin
     std := std + Sqr(Abs(BPM[n]-avrg));
   end;
 end;
 std2 := Sqrt(std/(j-1));
 Edit5.Text := FloatToStr(std);  }

end;

procedure TForm1.ScrollBar10Change(Sender: TObject);
begin
  M:=ScrollBar10.Position;
  Edit2.Text:=IntToStr(M);
  Button3.click;
end;

procedure TForm1.ScrollBar11Change(Sender: TObject);
begin
 T:=1/fs;
 Chart3LineSeries2.clear;
scrollbar11.Max:=n1;
z:=scrollbar11.position;
Chart3LineSeries2.addxy(z*T,0);
edit15.Text:=FloatToStr(z);
end;

procedure TForm1.ScrollBar12Change(Sender: TObject);
begin
  T:=1/fs;
 Chart3LineSeries3.clear;
scrollbar12.Max:=n1;
r:=scrollbar12.position;
Chart3LineSeries3.addxy(r*T,0);
edit16.Text:=FloatToStr(r);
end;

procedure TForm1.ScrollBar13Change(Sender: TObject);
begin
  T:=1/fs;
 Chart3LineSeries4.clear;
scrollbar13.Max:=n1;
c:=scrollbar13.position;
Chart3LineSeries4.addxy(c*T,0);
edit17.Text:=FloatToStr(c);
end;

procedure TForm1.ScrollBar14Change(Sender: TObject);
begin
  T:=1/fs;
 Chart3LineSeries5.clear;
scrollbar14.Max:=n1;
v:=scrollbar14.position;
Chart3LineSeries5.addxy(v*T,0);
edit18.Text:=FloatToStr(v);
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
   fc:= ScrollBar1.Position;
  Edit3.text:=IntToStr(fc);
   Button7.Click;
end;

procedure TForm1.ScrollBar2Change(Sender: TObject);
begin
  fl:= ScrollBar2.Position;
  Edit4.text:=IntToStr(fl);
  button8.click;
end;

procedure TForm1.ScrollBar3Change(Sender: TObject);
begin
  M2:= ScrollBar3.Position;
  Edit8.text:=IntToStr(M2);
  Button11.Click;
end;

procedure TForm1.ScrollBar9Change(Sender: TObject);
begin
  M1:= ScrollBar9.Position;
  Edit7.text:=IntToStr(M1);
  Button11.Click;
  //button12.click;
end;

procedure TForm1.TabSheet1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

procedure TForm1.TabSheet2ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Label22Click(Sender: TObject);
begin

end;

procedure TForm1.Label23Click(Sender: TObject);
begin

end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin

end;

//Clear series page 1
procedure TForm1.Button5Click(Sender: TObject);
begin
  Chart1LineSeries1.Clear;
  Chart2LineSeries1.Clear;
  Chart3LineSeries1.Clear;
  Chart4LineSeries1.Clear;
  Chart4LineSeries2.Clear;
  Chart4LineSeries3.Clear;
  Chart5LineSeries1.Clear;
  Chart5LineSeries2.Clear;
  Chart5LineSeries3.Clear;
end;

//Close
procedure TForm1.Button6Click(Sender: TObject);
begin
  close;
end;

//clear page 2
procedure TForm1.Button14Click(Sender: TObject);
begin
  Chart6LineSeries1.clear;
  Chart7LineSeries1.clear;
  Chart8LineSeries1.Clear;
  Chart9LineSeries1.clear;
  Chart10LineSeries1.clear;
  Chart10LineSeries2.clear;
  Chart11LineSeries1.clear;
  Chart11LineSeries2.clear;
  ListBox1.Clear;
  ListBox2.clear;
  Edit6.clear;
  //Edit5.clear;
end;
end.

