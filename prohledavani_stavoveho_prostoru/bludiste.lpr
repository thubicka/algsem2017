program prg_bludiste;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX} {$IFDEF UseCThreads}
  cthreads, {$ENDIF} {$ENDIF}
  Classes,
  GStack,
  GQueue;

{ you can add units after this }

const
  M = 20;
  N = 20;

  STARTp: integer = -1;
  ENDp: integer = -2;
  ZED: integer = -3;

type
  Position = record
    row: integer;
    col: integer;
    k: integer;
  end;

  StorageStructure = specialize TQueue<Position>;

  HerniPole = array[1..N, 1..M] of integer;

var
  DS: StorageStructure;
  lstart, lend: Position;
  pos: Position;

  bludiste: HerniPole;
  maxVelikost: SizeUInt;

  procedure postavZed;
  begin

    bludiste[1, 3] := ZED;
    bludiste[2, 3] := ZED;
    bludiste[2, 2] := ZED;
    bludiste[3, 3] := ZED;
    bludiste[4, 3] := ZED;
   { bludiste[2, 1] := ZED;}

  end;

  procedure initBludiste(s: Position; e: Position);
  var
    i, j: integer;
  begin
    for i := 1 to N do
      for j := 1 to M do
        bludiste[i, j] := 0;

    bludiste[s.row, s.col] := STARTp;
    bludiste[e.row, e.col] := ENDp;

    postavZed;

  end;

  procedure tiskBludiste;
  var
  i, j: integer;
  begin
    for i := 1 to N do
    begin
      for j := 1 to M do
      begin
        Write(bludiste[i, j]: 5, '|');
      end;
      Writeln;
    end;

    if DS.Size > maxVelikost then
      maxVelikost := DS.Size;

 {  WriteLn('Velikost struktury:', DS.Size, ', Max. velikost:', maxVelikost);}
  end;

  function lze_ulozit(r, c: integer): boolean;
  var
    h: integer;
  begin
    if (r >= 1) and (r <= N) and (c >= 1) and (c <= M) then
    begin
      h := bludiste[r, c];
      if (h = 0) or (h = ENDp) then
        lze_ulozit := True
      else
        lze_ulozit := False;
    end
    else
      lze_ulozit := False;

  end;

  function ulozSousedy(c: Position): boolean;
  var
    sousedpos: Position;
    pridano: boolean;
  begin

    pridano := False;

    if lze_ulozit(c.row - 1, c.col) then
    begin
      sousedpos.row := c.row - 1;
      sousedpos.col := c.col;
      sousedpos.k := c.k + 1;
      DS.Push(sousedpos);
      pridano := True;
    end;

    if lze_ulozit(c.row + 1, c.col) then
    begin
      sousedpos.row := c.row + 1;
      sousedpos.col := c.col;
      sousedpos.k := c.k + 1;
      DS.push(sousedpos);
      pridano := True;
    end;

    if lze_ulozit(c.row, c.col - 1) then
    begin
      sousedpos.row := c.row;
      sousedpos.col := c.col - 1;
      sousedpos.k := c.k + 1;
      DS.push(sousedpos);
      pridano := True;
    end;

    if lze_ulozit(c.row, c.col + 1) then
    begin
      sousedpos.row := c.row;
      sousedpos.col := c.col + 1;
      sousedpos.k := c.k + 1;
      DS.push(sousedpos);
      pridano := True;
    end;
    ulozSousedy := pridano;
  end;

  function isKonec(p: Position): boolean;
  begin
    if bludiste[p.row, p.col] = ENDp then
      isKonec := True
    else
      isKonec := False;
  end;


var
  finish: boolean;
  krok: integer;
  wayFound: boolean;

begin
  WriteLn('Start ... ');

  wayFound:= false;

  lstart.row := 1;
  lstart.col := 1;

  lend.row := 20;
  lend.col := 20;

  finish := False;
  krok := 1;

  initBludiste(lstart, lend);


  pos := lstart;
  pos.k := krok;

  DS := StorageStructure.Create;

  tiskBludiste;
  ReadLn;

  DS.push(pos);

  while (not finish) do
  begin

    pos := DS.Front;
    DS.Pop();

    if isKonec(pos) then
    begin
      finish := True;
      wayFound := True;
    end;

    if (bludiste[pos.row, pos.col] = 0) or (bludiste[pos.row, pos.col] = ENDp) or
      (bludiste[pos.row, pos.col] = STARTp) then
    begin
      bludiste[pos.row, pos.col] := pos.k;
      ulozSousedy(pos);
    end;

    if DS.IsEmpty() then
      finish := True;

  end;

  WriteLn('Finish...');

  if not wayFound then
    Writeln('Cesta nenalezena...');


  tiskBludiste;

  ReadLn;
end.
