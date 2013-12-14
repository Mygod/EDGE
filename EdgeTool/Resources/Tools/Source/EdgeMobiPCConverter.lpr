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
    writeln(ParamStr(n),'转换成功！');
  except
    on Exception do;
  end;
  if processed then writeln('按任意键退出……')
  else begin
    write('将Edge的关卡文件转换为');
    if toMobi then write('移动') else write('PC');
    writeln('版。你可以将一个或多个文件拖动到程序上。');
    writeln; write('to');
    if toMobi then write('Mobi') else write('PC');
    writeln(' [path1][,...]'); writeln;
    writeln('  path1 要处理的.bin文件。可以同时处理多个。'); writeln;
  end;
  ReadKey;
end.
