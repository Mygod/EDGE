uses classes, sysutils, easycrt;
const toMobi=true;
var n,m,i,j,k:longint; processed:boolean; stream:TFileStream;
begin
  for n:=1 to ParamCount do
  try
    stream:=TFileStream.Create(ParamStr(n),fmOpenReadWrite);
    stream.Position:=4; m:=stream.ReadDword; stream.Position:=8+m;
    for i:=1 to 5 do
    begin
      j:=stream.Position; k:=stream.ReadWord;
      if toMobi then k:=k*100 else k:=k div 100;
      stream.Position:=j; stream.WriteWord(k);
    end;
    stream.Destroy; processed:=true;
    writeln(ParamStr(n),'ת���ɹ���');
  except
    on Exception do;
  end;
  if processed then writeln('��������˳�����')
  else begin
    write('��Edge�Ĺؿ��ļ�ת��Ϊ');
    if toMobi then write('�ƶ�') else write('PC');
    writeln('�档����Խ�һ�������ļ��϶��������ϡ�');
    writeln; write('to');
    if toMobi then write('Mobi') else write('PC');
    writeln(' [path1][,...]'); writeln;
    writeln('  path1 Ҫ�����.bin�ļ�������ͬʱ��������'); writeln;
  end;
  ReadKey;
end.
