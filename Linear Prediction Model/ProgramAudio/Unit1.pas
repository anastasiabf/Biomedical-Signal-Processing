unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SLCommonGen, ALCommonGen, ALGenericGen, ALAudioIn,
  SLCommonFilter, ALCommonFilter, ALBasicGenericFilter, ALGenericFilter,
  LPComponent, ALBasicAudioOut, ALAudioOut, TeEngine, Series, ExtCtrls,
  TeeProcs, Chart, StdCtrls, SLBasicGenericReal, SLGenericReal, ComCtrls,
  Grids, SDL_matrix,math, ALDSAudioOut, MLDSPlayer, ALDSAudioPlayer,
  ALCommonSplitter, ALAudioToReal, ALCommonLogger, ALWaveLogger,
  ALCommonPlayer, ALWavePlayer;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Shape1: TShape;
    ALAudioOut1: TALAudioOut;
    ALGenericFilter1: TALGenericFilter;
    ALAudioIn1: TALAudioIn;
    ALGenericGen1: TALGenericGen;
    SLGenericReal1: TSLGenericReal;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Matrix1: TMatrix;
    Matrix2: TMatrix;
    GroupBox2: TGroupBox;
    ScrollBar1: TScrollBar;
    Edit3: TEdit;
    Edit4: TEdit;
    Label4: TLabel;
    Button4: TButton;
    Label12: TLabel;
    Button6: TButton;
    GroupBox3: TGroupBox;
    Button7: TButton;
    Button8: TButton;
    Edit5: TEdit;
    Label13: TLabel;
    StringGrid4: TStringGrid;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Chart2: TChart;
    Series2: TLineSeries;
    TabSheet2: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    StringGrid1: TStringGrid;
    ListBox1: TListBox;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    TabSheet4: TTabSheet;
    StringGrid6: TStringGrid;
    Chart7: TChart;
    Series7: TLineSeries;
    Series9: TLineSeries;
    TabSheet5: TTabSheet;
    Chart3: TChart;
    Series3: TLineSeries;
    Chart4: TChart;
    Series4: TLineSeries;
    StringGrid5: TStringGrid;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Button9: TButton;
    OpenDialog1: TOpenDialog;
    PageControl2: TPageControl;
    Chart5: TChart;
    Series5: TLineSeries;
    Chart6: TChart;
    Series6: TLineSeries;
    Button10: TButton;
    Series10: TLineSeries;
    Series11: TLineSeries;
    Label10: TLabel;
    GroupBox4: TGroupBox;
    Button5: TButton;
    Button3: TButton;
    Label11: TLabel;
    PageControl3: TPageControl;
    TabSheet6: TTabSheet;
    Chart1: TChart;
    Series1: TLineSeries;
    Series8: TLineSeries;
    Series12: TLineSeries;
    TabSheet3: TTabSheet;
    Chart8: TChart;
    Series13: TLineSeries;
    Series14: TLineSeries;
    Series15: TLineSeries;
    Series16: TLineSeries;
    Edit6: TEdit;
    Label14: TLabel;
    ALWavePlayer1: TALWavePlayer;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ALGenericFilter1ProcessData(Sender: TObject;
      InBuffer: IALAudioBuffer; var OutBuffer: IALAudioBuffer;
      var SendOutputData: Boolean);
    procedure ALGenericGen1Generate(Sender: TObject;
      var OutBuffer: IALAudioBuffer; var Populated, Finished: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Spectral_Domain;
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
const
fs=11025;

var
  Form1: TForm1;
  sinyal_rekam, x, x_out, x_out2 ,error, error2: array [-200000..200000] of Extended;
  inbuff_size, ndata,count, p: integer;
  rxx,a, a_inv: array[-100000..100000] of extended;
  //Identity_Matrix : array [0..1000,0..1000] of Integer;
  filename, namafile: TextFile;
  temp1, temp2, xhat : real;
  im, re, omega, counter, durasi : extended;
  freq_PRED, freq_IF, mag_PRED, mag_IF : array[0..500000] of extended;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  inbuff_size:= StrToInt(Edit1.text);
  ndata := StrToInt(edit2.Text);
  Edit4.Text:= IntToStr(fs)
end;

procedure TForm1.Button1Click(Sender: TObject);
var tombol1: string;
n : integer;
begin
  //start record
  tombol1 := Button1.caption;
  if tombol1='START' then
  begin
    count:=0;
    button1.Caption:='STOP';
    ALAudioIn1.Start();
    Shape1.Brush.Color:=clYellow;

    for n:=0 to ndata-1 do
    begin
      sinyal_rekam[n]:=0;
    end;
  end
  else if tombol1='STOP' then
  begin
    ALAudioIn1.Stop();
    Shape1.Brush.Color:=clRed;
    Button1.caption:='START';
  end;
end;

procedure TForm1.ALGenericFilter1ProcessData(Sender: TObject;
  InBuffer: IALAudioBuffer; var OutBuffer: IALAudioBuffer;
  var SendOutputData: Boolean);
  var i:integer;
begin
  for i:=0 to inbuff_size-1 do
    begin
      sinyal_rekam[count]:= InBuffer[i,0];
      count:=count+1;
      if count>=ndata then
      begin
        ALGenericFilter1.SendStopCommand;
        ALAudioIn1.Stop;
      end;
    end;
end;

procedure TForm1.ALGenericGen1Generate(Sender: TObject;
  var OutBuffer: IALAudioBuffer; var Populated, Finished: Boolean);
  var i:integer;
begin
  for i:=0 to inbuff_size-1 do
  begin
    OutBuffer[i,0]:= round(sinyal_rekam[count]);
    OutBuffer[i,1]:= round(sinyal_rekam[count]);
    count:=count+1;
  if count>=ndata then
  begin
    ALGenericGen1.Stop;
    ALAudioOut1.Enabled:=False;
    ALGenericGen1.Enabled:=False;
    Break;
  end;
  end;
end;

//input data from file
procedure TForm1.Button9Click(Sender: TObject);
var i: integer;
begin
with OpenDialog1 do
begin
Filter := 'Data File (*.wav)|*.wav';
DefaultExt := 'wav';
Filename := '1SoundRecorded';
end;
if OpenDialog1.Execute then
begin
ALWavePlayer1.Enabled := True;
ALWavePlayer1.FileName:=OpenDialog1.FileName;
ALWavePlayer1.Start();
end;
Button9.Enabled := True;
Counter := ALWavePlayer1.SamplesCount;
Durasi := ALWavePlayer1.DurationTime;
end;

//plot signal
procedure TForm1.Button2Click(Sender: TObject);
var i:integer;
begin
  Series1.Clear;
  count:=0;
  ALGenericGen1.Enabled:=True;
  ALAudioOut1.Enabled:=True;
  for i:=0 to ndata-1 do
  begin
    Series1.AddXY(i, sinyal_rekam[i]);    //plot sinyal
  end;
end;

//Auto correlation process
procedure TForm1.Button4Click(Sender: TObject);
var i,j,k,n,m : Integer;
jumxx,c,sigma : real;
s,s1: string;
begin
   p := ScrollBar1.Position;       //orde
   edit3.text:= IntToStr(p);
   for i := 0 to round(ndata-1) do
    begin
    jumxx := 0;
    for j := 0 to Round(ndata-1) do
      begin
        x[j] := sinyal_rekam[j];
        jumxx := jumxx + (x[j]*x[j-i]);
      end;                                                          
    rxx[i] := jumxx/ndata;
    rxx[-i]:=rxx[i];
    //plot auto correlation
    Series2.AddXY(i/fs, rxx[i]);
  end;

//data rxx
for i:=0 to p-1 do
begin
  StringGrid3.RowCount:=p;
  Str(rxx[i]:3:3,s);
  ListBox1.Items.Add('rxx['+IntToStr(i)+']='+s);
  StringGrid3.Cells[0,i]:= FloatToStr(rxx[i]);
end;
end;

//Predictor Coefficient
procedure TForm1.Button6Click(Sender: TObject);
var n,m,i,j,k : integer;
jumxx,c,sigma: real;
s : string;
begin
//plot matriks Rxx
Matrix1.Resize(p,p);
StringGrid1.RowCount:=p;
StringGrid1.ColCount:=p;
for n := 1 to p do
begin
  for m:= 1 to p do
  begin
    Matrix1.Elem[n,m]:= rxx[(n-1)-(m-1)];
    Str(Matrix1.Elem[n, m]:2:5, s);
    StringGrid1.Cells[m-1, n-1] := s;
  end;
end;

//Invers matriks Rxx
Matrix1.Invert;
StringGrid2.RowCount:=p;
StringGrid2.ColCount:=p;
for n := 1 to p do      //row
  begin
    for m := 1 to p do    //column
    begin
      Str(Matrix1.Elem[n, m]:2:5, s);
      StringGrid2.Cells[n-1, m-1] := s;
    end;
  end;

//Predictor coeff  (a)
 Matrix2.Resize(1, p);
 StringGrid5.RowCount:=p;
  for n := 1 to p do      //row
  begin
    jumxx := 0;
    for m := 1 to p do    //column
    begin
      jumxx := jumxx + (Matrix1.Elem[n, m]*rxx[m]);
    end;
    a[n]  := jumxx;
    StringGrid5.Cells[0,n-1]:= FloatToStr(a[n]);
  end;

//a invers transpose
  Matrix2.Resize(1,p+1);
  a[0]:= -1;
  for k:= 0 to p do
  begin
  a[0]:=-1;
  StringGrid6.RowCount:=p+1;
  a_inv[k]:= -a[k];
  StringGrid6.Cells[0,0]:=FloatToStr(a_inv[0]);
  StringGrid6.Cells[0,k]:=FloatToStr(a_inv[k]);
  Series7.AddXY(k, a_inv[k]);
  Series9.AddXY(k, a[k]);
  end;
end;


//error   (rumus kuning)
procedure TForm1.Button7Click(Sender: TObject);
var i,j : Integer;
sumxx,LP,xx:real;
begin
for i := 0 to ndata-1 do
  begin
    sumxx := 0;
    error[i]:=0;
    for j := 1 to p do
    begin
      a_inv[j]:=-a[j];
      sumxx := sumxx + (a[j]*sinyal_rekam[i-j]);
    end;
    error[i]:= sinyal_rekam[i]-sumxx;
    Series3.AddXY(i,error[i]);        //e(m)
    series4.AddXY(i, sumxx);          //
    series8.AddXY(i, sumxx);
    Series12.AddXY(i,error[i]);
  end;

//error rumus ijo
for i := 0 to ndata-1 do
  begin
    //xx := 1;
    //error2[i]:=0;
    for j := 0 to p-1 do
    begin
    if i-j<0 then begin
      xx:=0;
      end
      else begin
      xx:=sinyal_rekam[i-j];
      end;
      error2[i] := error2[i] +(a_inv[j]*xx);
    end;
    Series15.AddXY(i, error2[i]);
  end;
end;

//linear prediction
procedure TForm1.Button8Click(Sender: TObject);
var
  n, k : Integer;
  LP,LP2,mse,mse2 : Real;
begin
  //Prediction Signal
  for n := -p to -1 do
  begin
    x_out[n]   :=0;
    x_out2[n]  := 0;
  end;

  for n := 0 to ndata-1 do
  begin
    LP := 0;
    for k := 1 to p do
    begin
      LP := LP + a[k]*sinyal_rekam[n-k];
    end;
    x_out[n] := LP + error[n] ;
    Series13.AddXY(n, x_out[n]);
  end;

  for n := 0 to ndata-1 do
  begin
    LP2 := 0;
    for k := 1 to p do
    begin
      LP2 := LP2 + a[k]*sinyal_rekam[n-k];
    end;
    x_out2[n] := LP2 + error2[n] ;
    Series14.AddXY(n, x_out2[n]);
    series16.AddXY(n, sinyal_rekam[n])
  end;
  count := 0;
  ALGenericGen1.Enabled := True;
  ALAudioOut1.Enabled := True;

  //Mean Squared Error
  mse :=0;
  for k:=0 to ndata-1 do
  begin
  mse := mse + sqr(x[k]-x_out[k]);
  end;
  mse := mse/(ndata-1);
  Edit5.Text:=FloatToStr(mse);

  mse2 :=0;
  for k:=0 to ndata-1 do
  begin
  mse2 := mse2 + sqr(x[k]-x_out2[k]);
  end;
  mse2 := mse2/(ndata-1);
  Edit6.Text:=FloatToStr(mse2);
end;

procedure TForm1.Spectral_Domain;
var i,k : Integer;
begin
  Series5.Clear;
  Series6.Clear;
  Series10.Clear;
  Series11.Clear;
  for i:=0 to ndata-1 do
  begin
  temp1 := 0;
  temp2 := 0;
    for k:=1 to p do
    begin
    temp1 := temp1+(a[k]*cos(2*pi*k*(i/ndata)));
    temp2 := temp2-(a[k]*sin(2*pi*k*(i/ndata)));
    end;
  end;

  for i:= 0 to 314 do
  begin
  im := 0;
  re := 0;
  omega := i/100;
    for k:=0 to p-1 do
    begin
    re := re + (a[k]*cos((k+1)*omega));
    im := im - (a[k]*sin((k+1)*omega));
    end;
    //frequency response
    freq_PRED[i] := (1/(sqrt(sqr(1-re)+sqr(im)))); //Predictor
    freq_IF[i] := (sqrt(sqr(1-re)+sqr(im))); //invers filter
    Series5.AddXY(((omega/pi)*(fs/2)),freq_PRED[i]);
    Series10.AddXY(((omega/pi)*(fs/2)),freq_IF[i]);

    //magnitude response
    mag_PRED[i]:=20*log10(freq_PRED[i]); //Predictor
    mag_IF[i]:=20*log10(freq_IF[i]); //invers filter
    series6.AddXY(((omega/pi)*(fs/2)),mag_PRED[i]);
    series11.AddXY(((omega/pi)*(fs/2)),mag_IF[i]);
  end;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
Spectral_Domain;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
close;
end;

procedure TForm1.Button5Click(Sender: TObject);
var i : integer;
begin
//Series1.clear;
Series2.Clear;
Series4.Clear;
Series3.Clear;
Series5.clear;
Series6.clear;
Series7.clear;
Series8.clear;
Series9.clear;
Series10.clear;
series11.clear;
series12.clear;
series13.clear;
series14.clear;
series15.clear;
series16.clear;

ListBox1.Clear;
  for i := 0 to p - 1 do
    begin
    StringGrid1.Cols[i].Clear;
    StringGrid1.Rows[i].Clear;
    StringGrid2.Cols[i].Clear;
    StringGrid2.Rows[i].Clear;
    StringGrid3.Cols[i].Clear;
    StringGrid3.Rows[i].Clear;
    StringGrid5.Cols[i].Clear;
    StringGrid5.Rows[i].Clear;
    StringGrid6.Cols[i].Clear;
    StringGrid6.Rows[i].Clear;
    end;
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
var p:integer;
begin
 p := ScrollBar1.Position;       //orde
   edit3.text:= IntToStr(p);
end;

end.
