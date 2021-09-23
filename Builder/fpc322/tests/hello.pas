program hello;

uses dos, crt{$IFDEF GO32V2}, go32{$ENDIF};

{$IFDEF GO32V2}
var
  m: TMemInfo;
  r: Boolean;
{$ENDIF}

begin
  ClrScr;
  {$IFDEF MSDOS}WriteLn('Hello from 16-bit MS-DOS!');{$ENDIF}
  {$IFDEF GO32V2}WriteLn('Hello from 32-bit protected mode!');{$ENDIF}
  WriteLn('You are running DOS Version ',Lo(DosVersion),'.',Hi(DosVersion));
  {$IFDEF MSDOS}
  WriteLn('MaxAvail=',MaxAvail,#10#13,'MemAvail=',MemAvail);{$ENDIF}
  {$IFDEF GO32V2}
  r:=get_meminfo(m); { Always returns False according to docs }
  if int31error <> 0 then
  begin
    WriteLn('Error getting memory information from DPMI Host!');
    Halt(1);
  end;
  with m do
    WriteLn('Available memory=',available_memory div 1024,'KB');
  {$ENDIF}
end.
