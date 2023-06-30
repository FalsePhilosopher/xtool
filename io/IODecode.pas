unit IODecode;

{$POINTERMATH ON}

interface

uses
  Threading, Utils, SynCommons, SynCrypto, ParseClass, ParseExpr,
  IOUtils,
  WinAPI.Windows, WinAPI.ShlObj,
  System.SysUtils, System.Classes, System.SyncObjs, System.Math, System.Types,
  System.StrUtils, System.RTLConsts, System.TimeSpan, System.Diagnostics,
  System.IOUtils, System.Generics.Defaults, System.Generics.Collections;

type
  PDecodeOptions = ^TDecodeOptions;

  TDecodeOptions = record

  end;

  PExtractOptions = ^TExtractOptions;

  TExtractOptions = record

  end;

procedure PrintHelpExtract;
procedure ParseDecode(ParamArg: TArray<string>; out Options: TDecodeOptions);
procedure ParseExtract(ParamArg: TArray<string>; out Options: TExtractOptions);
procedure Decode(Input1: TStream; Input2, Output: String;
  Options: TDecodeOptions);
procedure Extract(Input1: TStream; Input2, Output: String;
  Options: TExtractOptions);

implementation

procedure PrintHelpExtract;
var
  I, J: Integer;
  S: string;
begin
  WriteLn(ErrOutput, 'extract - extract sectors from files');
  WriteLn(ErrOutput, '');
  WriteLn(ErrOutput, 'Usage:');
  WriteLn(ErrOutput,
    '  xtool extract decode_data original_data extracted_streams ');
  WriteLn(ErrOutput, '');
end;

procedure ParseDecode(ParamArg: TArray<string>; out Options: TDecodeOptions);
var
  ArgParse: TArgParser;
  ExpParse: TExpressionParser;
  S: String;
begin
  ArgParse := TArgParser.Create(ParamArg);
  ExpParse := TExpressionParser.Create;
  try
    S := '';
  finally
    ArgParse.Free;
    ExpParse.Free;
  end;
end;

procedure ParseExtract(ParamArg: TArray<string>; out Options: TExtractOptions);
var
  ArgParse: TArgParser;
  ExpParse: TExpressionParser;
  S: String;
begin
  ArgParse := TArgParser.Create(ParamArg);
  ExpParse := TExpressionParser.Create;
  try
    S := '';
  finally
    ArgParse.Free;
    ExpParse.Free;
  end;
end;

procedure Decode(Input1: TStream; Input2, Output: String;
  Options: TDecodeOptions);
var
  I, J: Integer;
  LEntry: TEntryStruct1;
  LBytes: TBytes;
  LFilename: String;
  BaseDir1, BaseDir2: String;
  SS1, SS2: TSharedMemoryStream;
begin
  if FileExists(Input2) then
    BaseDir1 := ExtractFilePath(TPath.GetFullPath(Input2))
  else if DirectoryExists(Input2) then
    BaseDir1 := IncludeTrailingPathDelimiter(TPath.GetFullPath(Input2))
  else
    BaseDir1 := ExtractFilePath(TPath.GetFullPath(Input2));
  if FileExists(Output) then
    BaseDir2 := ExtractFilePath(TPath.GetFullPath(Output))
  else if DirectoryExists(Output) then
    BaseDir2 := IncludeTrailingPathDelimiter(TPath.GetFullPath(Output))
  else
    BaseDir2 := ExtractFilePath(TPath.GetFullPath(Output));
  while true do
  begin
    try
      Input1.ReadBuffer(I, I.Size);
    except
      break;
    end;
    SetLength(LBytes, I);
    Input1.ReadBuffer(LBytes[0], I);
    SS1 := TSharedMemoryStream.Create
      (LowerCase(ChangeFileExt(ExtractFileName(Utils.GetModuleName),
      '_' + Random($7FFFFFFF).ToHexString + XTOOL_MAPSUF2)),
      BaseDir2 + StringOf(LBytes));
    try
      Input1.ReadBuffer(I, I.Size);
      for J := 0 to I - 1 do
      begin
        Input1.ReadBuffer(LEntry, SizeOf(TEntryStruct1));
        LFilename := BaseDir1 + LEntry.Filename;
        if FileExists(LFilename) then
        begin
          SS2 := TSharedMemoryStream.Create
            (LowerCase(ChangeFileExt(ExtractFileName(Utils.GetModuleName),
            '_' + Random($7FFFFFFF).ToHexString + XTOOL_MAPSUF2)), LFilename);
          try
            Move(SS2.Memory^, (PByte(SS1.Memory) + LEntry.Position)^,
              Min(SS2.Size, LEntry.Size));
          finally
            SS2.Free;
          end;
          WriteLn(ErrOutput, Format('Restored %s', [LEntry.Filename]));
        end;
      end;
    finally
      SS1.Free;
    end;
  end;
end;

procedure Extract(Input1: TStream; Input2, Output: String;
  Options: TExtractOptions);
var
  I, J: Integer;
  LEntry: TEntryStruct1;
  LBytes: TBytes;
  LFilename: String;
  BaseDir1, BaseDir2: String;
  FS1, FS2: TFileStream;
begin
  if FileExists(Input2) then
    BaseDir1 := ExtractFilePath(TPath.GetFullPath(Input2))
  else if DirectoryExists(Input2) then
    BaseDir1 := IncludeTrailingPathDelimiter(TPath.GetFullPath(Input2))
  else
    BaseDir1 := ExtractFilePath(TPath.GetFullPath(Input2));
  if FileExists(Output) then
    BaseDir2 := ExtractFilePath(TPath.GetFullPath(Output))
  else if DirectoryExists(Output) then
    BaseDir2 := IncludeTrailingPathDelimiter(TPath.GetFullPath(Output))
  else
    BaseDir2 := ExtractFilePath(TPath.GetFullPath(Output));
  while true do
  begin
    try
      Input1.ReadBuffer(I, I.Size);
    except
      break;
    end;
    SetLength(LBytes, I);
    Input1.ReadBuffer(LBytes[0], I);
    FS1 := TFileStream.Create(BaseDir1 + StringOf(LBytes), fmShareDenyNone);
    try
      Input1.ReadBuffer(I, I.Size);
      for J := 0 to I - 1 do
      begin
        Input1.ReadBuffer(LEntry, SizeOf(TEntryStruct1));
        LFilename := BaseDir2 + LEntry.Filename;
        ForceDirectories(ExtractFilePath(LFilename));
        FS2 := TFileStream.Create(LFilename, fmCreate);
        try
          FS1.Position := LEntry.Position;
          CopyStreamEx(FS1, FS2, LEntry.Size);
        finally
          FS2.Free;
        end;
        WriteLn(ErrOutput, Format('Extracted %s', [LEntry.Filename]));
      end;
    finally
      FS1.Free;
    end;
  end;
end;

end.
