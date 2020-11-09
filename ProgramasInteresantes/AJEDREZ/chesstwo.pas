{---------------------------------------------------------------------------}
{  Programa    : ChessTwo (Ajedrez 2 player)... RUN TPX.EXE                 }
{  Lenguaje    : Turbo Pascal 7.0                                           }
{  Fecha       : Febrero                                                    }
{  Programador : Aguilar Olgu¡n Jimmy A.                 (c) Copyright 2000 }
{---------------------------------------------------------------------------}

{ Ctrl + N -> Nuevo juego
  Esc      -> Salir
  Ctrl + Z -> Deshacer ultima jugada  }

{$F+}
Program ChessTwo;

Uses
    Crt,
    SoftCmd, SoftCrt,
    Graph, vGraph, ToolBar,
    GetMouse, MCursor;

Type
    tpPie = ^tbPie;
    tbPie  = Array[0..(33*33*12)] of Byte;

    rPoscur = Record
                    h,v : Integer;
              end;
    tPieza  = -6..6;
    tTable  = Array[1..8,1..8] of tPieza;
    tMovLeg = Array[1..8,1..8] of Boolean;
    tTurno  = (Blancas, Negras);

Const
    bCol : Byte = 11;         { Color casilla Blanca }
    nCol : Byte = 9;          { Color casilla Negra }
    Vacio = 0;
    bPeon    = 1;   bTorre = 2;
    bCaballo = 3;   bAlfil = 4;
    bDama    = 5;   bRey   = 6;
    nPeon    = -1;  nTorre = -2;
    nCaballo = -3;  nAlfil = -4;
    nDama    = -5;  nRey   = -6;
    sigTurno : array[0..1] of tPieza = (1,-1);
    txtJug   : string[10] = '';
    lstJug   : string[10] = '';
    txtTurno : array[0..1] of string[8] = ('Blancas','Negras');
    txtPieza : array[-6..6] of string[8] =
               ('nRey','nDama','nAlfil','nCaballo','nTorre','nPeon','  ',
                'bPeon','bTorre','bCaballo','bAlfil','bDama','bRey');

Var
    Table, aTable   : tTable;
    movLeg,movOOO   : tMovLeg;
    Pieza, aPieza   : tPieza;
    Last, posCur    : rPosCur;
    Turno           : tTurno;
    nTurno          : byte;
    selec, cond,
    mLegal, Salir, ONtBar,
    Jaque, jMate, noBack,
    aJaque, Click,
    mOO,mOOO        : Boolean;
    bmpPie          : tpPie;

    Mensaje, aMens  : string;
    Key             : Char;
    KeySpec         : byte;
    i,j             : integer;


Procedure Beep(frec,dur : integer);
begin
     sound(frec); delay(dur);
     noSound;
end; { Beep }

function txtMov : string;
begin
     txtMov := txtPieza[Pieza]+' '+chr(last.h+96)+chr(last.v+48)+'-'+
               chr(poscur.h+96)+chr(poscur.v+48)
end; { txtMov }

procedure wJugada;
var jug  : string[7];
    vPos : byte;
    Tamano       : Integer;
    PuntBox      : Pointer;
begin
     SetTextJustify(LeftText,TopText);  SetTextStyle(2,HorizDir,4);
     setFillStyle(1,7);
     if (nTurno > 10) and (turno=blancas) and (noBack) then
        begin
             Tamano := ImageSize(420,190,590,340);
             GetMem(PuntBox, Tamano);
             GetImage(420,190,590,340, PuntBox^);
             PutImage(420,175,PuntBox^,Normalput);
             FreeMem(PuntBox, Tamano);
             Bar(420,325,590,340);
        end;
     SetColor(0);
     jug := txtJug;
     if jug[5] in ['A'..'T'] then jug[4] := 'x';
     if nTurno <=10 then vPos := nTurno else vPos := 10;
     if turno=blancas then
        begin
           outTextXY(420,175+(vPos*15), intToStr(nTurno));
           if not noBack then Bar(460,175+(vPos*15),540,190+(vPos*15));
           outTextXY(460,175+(vPos*15), AllTrim(jug));
        end
     else
        begin
           if not noBack then Bar(540,175+(vPos*15),590,190+(vPos*15));
           outTextXY(540,175+(vPos*15), allTrim(jug));
        end;
end;

Procedure wMens(texto : string);
begin
     SetTextJustify(LeftText,TopText);  SetTextStyle(2,HorizDir,4);
     SetColor(7);  OutTextXY(15,MaxY-20, Mensaje);
     Mensaje := texto;
     SetColor(0);  OutTextXY(15,MaxY-20, Mensaje);
end;


Procedure MovePieMem(FileBM: String; Var VarMem: tbPie);
Var Arch     : File;
    Resul, N,
    Tamanno  : word;
    bmpT,
    temp     : tpPie;
Begin
    If FileExist(FileBM) then
    Begin
      Assign(Arch, FileBM);
      Reset(Arch, 1); Seek(Arch, 11);
      Tamanno := SizeOf(tbPie) div 2 + 1;
      GetMem(temp, Tamanno);
      BlockRead(Arch, temp^, Tamanno, Resul);
      GetMem(bmpT, SizeOf(tbPie));
      For N:=0 to SizeOf(tbPie)+1 do bmpT^[N] := 0;
      For N:=0 to Tamanno+2 do
        Begin bmpT^[(N*2)]   := temp^[N] shr 4;
              bmpT^[(N*2)+1] := temp^[N] - (bmpT^[(N*2)] shl 4);  End;
      FreeMem(temp, Tamanno);
      Move(bmpT^, VarMem, SizeOf(tbPie));
      FreeMem(bmpT, SizeOf(tbPie));
      Close(Arch);
    End;
End; { MovePieMem }


procedure drawPieza(nPie,x,y : integer);
Var F,C,Color,numBar : Byte;
begin
     if nPie>0 then numBar := (nPie-1)*2
     else numBar := Abs(nPie)*2-1;
     if (numBar in [0..12]) then
     for F:=0 to 32 do for C:=0 to 32 do
       begin
         Color := bmpPie^[C+(F*33)+(numBar*(33*33))];
         if Color<>3 then PutPixel(x+C,y+F, Color)
       end;
end; { drawPieza }


Procedure setPieza(h,v:Integer; nPieza: Integer);
Begin
     if nPieza=0 then
       begin
          if (h+v) mod 2 <> 0 then SetFillStyle(1,bCol)
          else SetFillStyle(1,nCol);
          Bar(43+((h-1)*40), 373-((v-1)*40),
              76+((h-1)*40), 406-((v-1)*40));
          Table[h,v] := Vacio;
       end
     else
       if (nPieza>=-6) and (nPieza<=6) then
       begin
          drawPieza(nPieza, 43+((h-1)*40), 373-((v-1)*40));
          Table[h,v] := nPieza;
       end
End; { setPieza }


Procedure setPos(Color: Byte);
Begin
     SetColor(Color);
     SetLineStyle(0,1, 3);
     setMouse(off);
     with posCur do
     Rectangle(41+((h-1)*40), 371-((v-1)*40),
               78+((h-1)*40), 408-((v-1)*40));
     setMouse(On);
End; { setPos }


Procedure Tablero;
begin
     for i:=0 to 7 do
        for j:=0 to 7 do
           begin
                SetFillStyle(1,nCol);
                if (i+j) mod 2 <> 0 then
                  Bar(40+(40*i), 90+(40*j),
                      39+(40*i)+40, 89+(40*j)+40);
           end;
end; { Tablero }


procedure wTurno;
begin
     SetLineStyle(0,1, 0);
     SetTextStyle(2,0,4); SetTextJustify(0,0);
     if Turno=blancas then InText3D(455,113,595,132, 15)
     else InText3D(455,113,595,132, 0);
     if Turno=blancas then setColor(0) else setColor(15);
     OutTextXY(460,125, intToStr(nTurno)+Repli(5,#32)+txtTurno[ord(turno)]);
end; { wTurno }


Procedure initGame;
Begin
     Turno := blancas;
     nTurno := 0;
     Jaque := false;
     jMate := false;
     for i:=1 to 8 do
        for j:=1 to 8 do Table[i,j] := 0;
     setMouse(off);
     for i:=2 to 6 do setPieza(i-1,8, -i);
     for i:=2 to 4 do setPieza(4+i,8, -(6-i));
     for i:=1 to 8 do setPieza(i,2, bPeon);
     for i:=1 to 8 do setPieza(i,7, nPeon);
     for i:=2 to 6 do setPieza(i-1,1, i);
     for i:=2 to 4 do setPieza(4+i,1, 6-i);
     setMouse(on);
     PosCur.h := 5; PosCur.v := 2;
     setPos(12);
     Selec := false;
     for i:=1 to 8 do
        for j:=1 to 8 do
            if j in [1,2,7,8] then movOOO[i,j] := false
                              else movOOO[i,j] := true;
     mOO := false;  mOOO := mOO;
     noBack := true;
     wTurno;
     wMens('Comienza partida, juegan las blancas');
End; { initGame }


procedure DrawChessT;
begin
     iconWin := 'chesstwo.ico';  cInWin := 3;
     WindowMenu(0,0,639,479, On,On, 'ChessTwo');
     GetBMP16('chesstwo.bar', 5,24, 7);
     { outTable }
     Bar(22,77,52+(40*8),107+(40*8));
     BoxShadow(22,77,52+(40*8),107+(40*8));
     InText3D(37,87,42+(40*8),92+(40*8), bCol);
     SetTextStyle(2,0,4);
     for i:=0 to 7 do
       begin
          SetColor(15); OutTextXY(60+(40*i),418, Chr(65+i));
          SetColor(0); OutTextXY(61+(40*i),419, Chr(65+i));

          SetColor(15); OutTextXY(30,390-(40*i), Chr(49+i));
          SetColor(0); OutTextXY(31,391-(40*i), Chr(49+i));
       end;
     Tablero;
     initGame;
     iconWin := '';
     WindowMsg(390,77,620,427, Off, 'Estado de juego');
     BoxShadow(395,104,615,420);
     SetTextStyle(2,0,4); SetTextJustify(0,0);
     SetColor(0);
     OutTextXY(410,125, 'Turno :'); wTurno;
     Boxg(410,360,600,410, 0,15);
     { Movimientos }
     BotonWin(bNormal, 410,150,440,170, Off, ' ');
     BotonWin(bNormal, 440,150,520,170, Off, ' ');
     BotonWin(bNormal, 520,150,600,170, Off, ' ');
     SetTextStyle(2,0,4); SetTextJustify(0,0);
     OutTextXY(415,162, 'Jug    Blancas       Negras'); wTurno;
     Boxg(410,170,600,345, 0,15);
end; { drawChessT }


procedure msgTurno;
begin
     setFillStyle(1,8); Bar(411,361,599,409);
     if selec then drawPieza(Pieza,415,368)
     else drawPieza(sigTurno[ord(turno)],415,368);
     GetBMP16('arrow2.ico',445,370, 3);
     SetTextStyle(2,0,4); SetTextJustify(0,0); setColor(15);
     OutTextXY(490,380,'Juegan las fichas');
     OutTextXY(490,395,txtTurno[ord(turno)]+'.');
end; { msgTurno }


procedure msgError;
begin
     setFillStyle(1,8); Bar(411,361,599,409);
     drawPieza(Pieza,415,368);
     GetBMP16('arrow1.ico',422,377, 3);
     SetTextStyle(2,0,4); SetTextJustify(0,0); setColor(15);
     OutTextXY(458,380,'Movimiento '+ copy(txtMov,2,length(txtMov)-1));
     OutTextXY(458,395,'NO permitido.    ');
end; { msgError }


procedure msgJaque;
begin
     setFillStyle(1,8); Bar(411,361,599,409);
     drawPieza(sigTurno[ord(turno)]*bRey,415,368);
     drawPieza(Pieza,480,368);
     GetBMP16('jaque.ico',449,371, 3);
     SetTextStyle(2,0,6); SetTextJustify(0,0);
     setColor(11);  OutTextXY(515,396,'Jaque!');
     {setColor(15); }OutTextXY(516,395,'Jaque!');
end; { msgJaque }


procedure msgjMate;
begin
     setFillStyle(1,8); Bar(411,361,599,409);
     drawPieza(sigTurno[ord(turno) xor 1]*bRey,415,368);
     GetBMP16('jMate.ico',427,374, 3);
     setColor(10); SetTextStyle(2,0,6); SetTextJustify(0,0);
     OutTextXY(465,380,'Jaque Mate...!');
     OutTextXY(466,381,'Jaque Mate...!');
     setColor(15); SetTextStyle(2,0,4);
     OutTextXY(465,397,'Ganan las '+txtTurno[ord(turno) xor 1]+'.');
end; { msgjMate }


procedure InitChess;
var Pal   : tPaleta;
Begin
     If Test8086 < 2 then
        begin WriteLn('Necesita un procesador 386 o superior.'); halt; end;
     InitVGATP(VGA, VGAHi, '');
     DirectVideo := false;
     maxX := GetMaxX; maxY := GetMaxY;
     getPalWindows;
     new(bmpPie);
     movePieMem('chesstwo.pie', bmpPie^);
     salir := false;
     setModeKeyb(Mem[0:$417] xor $20);
     verifyMouse;
     modeMouse := grafico;
     wMens('Iniciando juego, espere un momento...');
     drawChessT;
     SetMouse(On);
     msgTurno;
End; { initChess }


Procedure exitChess;
Begin
     setModeKeyb(Mem[0:$417] or $20);
     setMouse(Off);
     Dispose(bmpPie);
     Oscure256(20,15);
     setModeVideo($3);
     WriteLn;
     WriteLn('Desarrollado en Turbo Pascal 7.0, por: Aguilar Olgu¡n Jimmy Anthony');
     WriteLn;
     WriteLn('Visual Software Creative                                     (c) Copyright 1999');
End; { ExitChess}


function Coronar: tPieza;
Var Tamano,n      : Integer;
    Aux           : byte;
    PuntBox       : Pointer;
    tecla         : char;
    piez          : tPieza;
    click,dblClick: boolean;

    procedure PosCoro(nPie,Col: byte);
    begin setMouse(Off); setColor(Col);
          Rectangle(241+((nPie-1)*40), 229, 278+((nPie-1)*40), 266);
          setMouse(On);  end; { PosCoro }
Begin
    Tamano := ImageSize(233,200,405,273);
    GetMem(puntBox, Tamano);
    setMouse(off);
    GetImage(233,200,405,273, PuntBox^);
    cinWin := 10;
    WindowMsg(233,200,405,273, On, 'Coronar');
    wMens('Corona '+txtMov+', elija una pieza...');
    for n:=1 to 4 do
        drawPieza((N+1)*sigTurno[ord(turno)], 243+((n-1)*40),231);
    setMouse(on);
    SetLineStyle(0,1,3);
    n := 1;  posCoro(n,1);
    dblClick := false;
    Repeat
         if not keyPressed then
           begin
                Click := clickMouse;
                if Click then
                   begin
                        getStatusMouse;
                        posCoro(n,10);
                        n := 1 + (status.posX - 240) div 40;
                        posCoro(n,1);
                        delay(250);
                        dblClick := clickMouse;
                   end;
           end
         else
           begin
             tecla := readKey;
             if tecla = #0 then
                begin
                    tecla := readKey;
                    posCoro(n,10);
                    Case tecla of
                       #77: if n<4 then inc(n) else n:=1;
                       #75: if n>1 then dec(n) else n:=4;
                    end;
                    posCoro(n,1);
                end;
             end;
    Until (tecla=#13) or (dblClick);
    setMouse(Off);
    PutImage(233,200,PuntBox^,Normalput);  setMouse(on);
    FreeMem(PuntBox, Tamano);
    While KeyPressed do ReadKey;
    piez := n + 1;
    if turno = negras then piez := piez * -1;
    Coronar := piez;
end; { Coronar }


Procedure delLegal;
begin
     for i:=1 to 8 do
        for j:=1 to 8 do movLeg[i,j] := false;
end; { delLegal }


Function iColor(pie1,pie2 : integer) : boolean;
begin
     iColor := ((pie1 > 0) and (pie2 > 0)) or
               ((pie1 < 0) and (pie2 < 0));
end; { iColor ? }


Procedure jPeon(h,v, pie : integer);
begin
     if (v+pie in [1..8]) and (Table[h,v+pie] = Vacio) then
        movLeg[h,v+pie] := true;
     if (v+2*pie in [1..8]) and (Table[h,v+2*pie] = Vacio) and
        (v in [2,7]) and (Table[h,v+pie] = Vacio) then
        movLeg[h,v+2*pie] := true;
     if (not iColor(Pie,Table[h+1,v+pie])) and
        (Table[h+1,v+pie] <> Vacio) and (h+1<=8) and (v+pie in [1..8]) then
        movLeg[h+1,v+pie] := true;
     if not iColor(Pie,Table[h-1,v+pie]) and
        (Table[h-1,v+pie] <> Vacio) and (h-1>=1) and (v+pie in [1..8]) then
        movLeg[h-1,v+pie] := true;
end; { jPeon }


Procedure jAlfil(h,v, pieza : integer);
begin
     i := h+1;  j := v+1;
     while (Table[i,j] = vacio) and
           (i in [1..8]) and (j in [1..8]) do
        begin
             movLeg[i,j] := true; inc(i); inc(j);
        end;
      if (i in [1..8]) and (j in [1..8]) then
      if not iColor(Pieza,Table[i,j]) then
        movLeg[i,j] := true;

     i := h-1;  j := v+1;
     while (Table[i,j] = vacio) and
           (i in [1..8]) and (j in [1..8]) do
        begin
             movLeg[i,j] := true; dec(i); inc(j);
        end;
      if (i in [1..8]) and (j in [1..8]) then
      if not iColor(Pieza,Table[i,j]) then
        movLeg[i,j] := true;

     i := h-1;  j := v-1;
     while (Table[i,j] = vacio) and
           (i in [1..8]) and (j in [1..8]) do
        begin
             movLeg[i,j] := true; dec(i); dec(j);
        end;
      if (i in [1..8]) and (j in [1..8]) then
      if not iColor(Pieza,Table[i,j]) then
        movLeg[i,j] := true;

     i := h+1;  j := v-1;
     while (Table[i,j] = vacio) and
           (i in [1..8]) and (j in [1..8]) do
        begin
             movLeg[i,j] := true; inc(i); dec(j);
        end;
      if (i in [1..8]) and (j in [1..8]) then
      if not iColor(Pieza,Table[i,j]) then
        movLeg[i,j] := true;
end; { jAlfil }


Procedure jTorre(h,v, pieza : integer);
begin
     i := h+1;
     while (Table[i,v] = vacio) and (i <= 8) do
        begin
             movLeg[i,v] := true; inc(i);
        end;
     if i in [1..8] then
     if not iColor(Pieza,Table[i,v]) then movLeg[i,v] := true;

     i := h-1;
     while (Table[i,v] = vacio) and (i in [1..8]) do
        begin
             movLeg[i,v] := true; dec(i);
        end;
      if i in [1..8] then
      if not iColor(Pieza,Table[i,v]) then movLeg[i,v] := true;

     j := v+1;
     while (Table[h,j] = vacio) and (j in [1..8]) do
        begin
             movLeg[h,j] := true; inc(j);
        end;
      if j in [1..8] then
      if not iColor(Pieza,Table[h,j]) then movLeg[h,j] := true;

     j := v-1;
     while (Table[h,j] = vacio) and (j in [1..8]) do
        begin
             movLeg[h,j] := true; dec(j);
        end;
      if j in [1..8] then
      if not iColor(Pieza,Table[h,j]) then movLeg[h,j] := true;
end; { jTorre }


Procedure jCaballo(h,v, pieza : integer);
begin
    if v+2 <= 8 then
       begin
           if (not iColor(Pieza,Table[h+1,v+2])) and (h+1<=8) then
              movLeg[h+1,v+2] := true;
           if (not iColor(Pieza,Table[h-1,v+2])) and (h-1>=1) then
              movLeg[h-1,v+2] := true;
       end;
    if v-2 >= 1 then
       begin
           if (not iColor(Pieza,Table[h+1,v-2])) and (h+1<=8) then
              movLeg[h+1,v-2] := true;
           if (not iColor(Pieza,Table[h-1,v-2])) and (h-1>=1) then
              movLeg[h-1,v-2] := true;
       end;
    if h+2 <= 8 then
       begin
           if (not iColor(Pieza,Table[h+2,v+1])) and (v+1<=8) then
              movLeg[h+2,v+1] := true;
           if (not iColor(Pieza,Table[h+2,v-1])) and (v-1>=1) then
              movLeg[h+2,v-1] := true;
       end;
    if h-2 >= 1 then
       begin
           if (not iColor(Pieza,Table[h-2,v+1])) and (v+1<=8) then
              movLeg[h-2,v+1] := true;
           if (not iColor(Pieza,Table[h-2,v-1])) and (v-1>=1) then
              movLeg[h-2,v-1] := true;
       end;
end; { jCaballo }


Procedure jRey(h,v, pie : integer);
begin
     if (not iColor(Pie,Table[h,v+1])) and (v+1<=8)
        then movLeg[h,v+1] := true;
     if (not iColor(Pie,Table[h,v-1])) and (v-1>=1)
        then movLeg[h,v-1] := true;
     if (not iColor(Pie,Table[h+1,v])) and (h+1<=8)
        then movLeg[h+1,v] := true;
     if (not iColor(Pie,Table[h-1,v])) and (h-1>=1)
        then movLeg[h-1,v] := true;
     if (not iColor(Pie,Table[h+1,v+1])) and (h+1<=8) and (v+1<=8)
        then movLeg[h+1,v+1] := true;
     if (not iColor(Pie,Table[h-1,v-1])) and (h-1>=1) and (v-1>=1)
        then movLeg[h-1,v-1] := true;
     if (not iColor(Pie,Table[h+1,v-1])) and (h+1<=8) and (v-1>=1)
        then movLeg[h+1,v-1] := true;
     if (not iColor(Pie,Table[h-1,v+1])) and (h-1>=1) and (v+1<=8)
        then movLeg[h-1,v+1] := true;
     { enroque }
     if ((h=5) and (v in [1,8])) and (not movOOO[h,v]) then
        begin
            if (table[h+1,v]=0) and (table[h+2,v]=0) and (not movOOO[h+3,v])
              then movLeg[h+2,v] := true;
            if (table[h-1,v]=0) and (table[h-2,v]=0) and (table[h-3,v]=0) and
              (not movOOO[h-4,v]) then movLeg[h-2,v] := true;
        end;
end; { jRey }


Procedure SetmLegal(h,v, pieza : integer);
begin
    Case pieza of
        bPeon,nPeon       : jPeon(h,v, pieza);
        bAlfil,nAlfil     : jAlfil(h,v, pieza);
        bTorre,nTorre     : jTorre(h,v, pieza);
        bCaballo,nCaballo : jCaballo(h,v, pieza);
        bDama ,nDama      : begin jAlfil(h,v, pieza); jTorre(h,v, pieza) end;
        bRey,nRey         : jRey(h,v, pieza);
    end;
end; { SetmLegal }


Procedure verJaque;
Var i,j    : integer;
    cond   : boolean;
    auxLeg : tMovLeg;
begin
     auxLeg := movLeg;
     delLegal;
     for i:=1 to 8 do
        for j:=1 to 8 do
          begin
              if turno = blancas then cond := Table[i,j] < 0
              else cond := Table[i,j] > 0;
              if cond then SetmLegal(i,j,Table[i,j])
          end;
     Jaque := false;
     for i:=1 to 8 do
        for j:=1 to 8 do
            if (movLeg[i,j]) and (abs(table[i,j])=bRey) then
               begin Jaque := true;  break  end;
     movLeg := auxLeg
end; { verJaque }


procedure verjMate;
Var i,j,k,l   : integer;
    condi     : boolean;
    aLeg      : tMovLeg;
    auxTable  : tTable;
begin
     aLeg := movLeg;  aJaque := jaque;
     jMate  := true;
     for i:=1 to 8 do
        for j:=1 to 8 do
          begin
              if turno = blancas then condi := Table[i,j] > 0
              else condi := Table[i,j] < 0;
              if condi then
                 begin
                      delLegal;
                      setmLegal(i,j,Table[i,j]);
                      for k:=1 to 8 do
                        for l:=1 to 8 do
                        if movLeg[k,l] then
                          begin
                               auxTable := Table;
                               table[k,l] := table[i,j];
                               table[i,j] := 0;
                               verJaque;
                               Table := auxTable;
                               if not jaque then
                                  begin jMate := false;  break  end;
                          end;
                 end;
              if not jMate then break;
          end;
     movLeg := aLeg;  jaque := aJaque
end; { verjMate }


procedure verMovPie(modo : boolean);
var i,j : integer;
begin
     SetColor(14);
     SetLineStyle(0,1, 3);
     for i:=1 to 8 do
        for j:=1 to 8 do
     if (movLeg[i,j]) and (table[i,j]<>vacio) then
       begin
         if not modo then
            if (i+j) mod 2 = 0 then SetColor(nCol)
            else SetColor(bCol);
            Rectangle( 41+((i-1)*40), 371-((j-1)*40),
                       78+((i-1)*40), 408-((j-1)*40))
         end;
End; { verMovPie }


{ ------ }

procedure pushPieza;
begin
    with posCur do
      begin
          if turno = blancas then
               cond := Table[h,v] > 0
          else cond := Table[h,v] < 0;
          if cond then
            begin
               Pieza := Table[h,v];
               SetFillStyle(1,10);
               setMouse(off);
               Bar(41+((h-1)*40), 371-((v-1)*40),
                   78+((h-1)*40), 408-((v-1)*40));
               setPieza(h,v, Pieza);
               setMouse(on);
               selec := true;
               Last.h := h;
               Last.v := v;
               if not jMate then msgTurno;
            end
          else Beep(100,40);
          delLegal;
          With Last do SetmLegal(h,v, Pieza);
      end
end; { pushPieza }

procedure popPieza;
begin
     With posCur do
       if (h=Last.h) and (v=last.v) then
          begin
               Selec := false; setMouse(off);
               setPieza(h,v, Vacio);
               setPieza(h,v, Pieza); setMouse(On);
               setPos(12);
               Pieza := Vacio;
          end
       else
       begin
          mLegal := movLeg[h,v];
          if mLegal then
             begin
                 aTable := Table;  aJaque := Jaque;
                 with last do Table[h,v] := 0;
                 Table[h,v] := Pieza;
                 verJaque;
                 if Jaque then mLegal := false;
                 Table := aTable;  Jaque := aJaque;
             end;
          if mLegal then
            begin
                mOO := false; mOOO := false;
                if (Abs(Pieza)=bPeon) and (v in [1,8]) then
                   Pieza := Coronar;
                with last do
                if (not movOOO[h,v]) then movOOO[h,v] := true;
                setMouse(off);
                setPieza(Last.h,Last.v, 0);
                if (Abs(Pieza)=bRey) then
                   begin
                   if (h=last.h-2) then
                      begin
                           aPieza := table[h-2,v];
                           setPieza(h-2,v,0);
                           setPieza(h+1,v,aPieza);
                           mOOO := true;
                      end;
                   if (h=last.h+2) then
                      begin
                           aPieza := table[h+1,v];
                           setPieza(h+1,v,0);
                           setPieza(h-1,v,aPieza);
                           mOO := true;
                      end;
                   end;
                { Ultima jugada }
                if txtJug<>'' then lstJug := txtJug;
                if mOO then txtJug := '0-0'
                else if mOOO then txtJug := '0-0-0'
                     else
                         txtJug := txtPieza[Pieza][2]+
                                   chr(last.h+96)+chr(last.v+48)+'-'+
                                   txtPieza[table[h,v]][2]+
                                   chr(poscur.h+96)+chr(poscur.v+48)+' ';
                wJugada;
                noBack := true;
                {---------------}
                if table[h,v] <> Vacio then
                   begin
                        if (not movOOO[h,v]) then movOOO[h,v] := true;
                        setPieza(h,v, 0);
                   end;
                setPieza(h,v, Pieza);
                setMouse(On);
                selec := false;
                if turno=blancas then turno := negras
                else turno := blancas;
                if turno=blancas then inc(nTurno);
                wTurno;
                verJaque;
                if jaque then verjMate;
                aMens := '';
                if jMate then
                   begin
                       aMens := 'JAQUE MATE';
                       if turno=blancas then aMens := aMens +', ganan las negras.'
                       else aMens := aMens+', ganan las blancas.';
                       msgjMate;
                       for i:=1 to 20 do
                       beep(600-(i*25),30);
                       beep(400,80);
                   end
                else
                   begin
                       if Jaque then
                          begin
                               aMens := 'JAQUE... ';
                               msgJaque;
                               beep(1500,300); beep(1200,300);
                          end
                       else aMens := 'Movimiento ';
                       aMens := aMens + txtMov;
                       if turno=blancas then aMens := aMens +', juegan las blancas.'
                       else aMens := aMens+', juegan las negras.';
                       if not jaque then msgTurno;
                   end;
                wMens(aMens);
            end
          else
              begin
                  beep(400,80);
                  if (h+v) mod 2 <> 0 then SetPos(bCol)
                  else SetPos(nCol);
                  if not Jaque then
                     begin
                         wMens('Movimiento '+txtMov+' no permitido...,int‚ntelo de nuevo.');
                         msgError;
                     end;
                  h := last.h;
                  v := last.v;
                  setPos(12);
              end;
       end; { selec }
end; { popPieza }


function valPie(car : char): tPieza;
var val : tPieza;
begin
     Case car of
          'P' : val := 1;
          'T' : val := 2;
          'C' : val := 3;
          'A' : val := 4;
          'D' : val := 5;
          'R' : val := 6;
          else val := 0;
     end;
     if turno=blancas then valPie := val
     else valPie := val * -1;
end; { ValPie }

procedure backJug;
var aJug : string[7];
    auxPie : tPieza;
begin
    if ((nTurno=0) and (Turno=blancas)) or (selec) then
       beep(400,80)
    else
     with posCur do
       begin
            aJug := txtJug;
            if (h+v) mod 2 <> 0 then SetPos(bCol) else setPos(nCol);
            setMouse(Off);
            if copy(aJug,1,3)='0-0' then
               begin
                  h := 5;
                  if turno = negras then v := 1 else v := 8;
                  if aJug = '0-0' then
                     begin
                         auxPie := table[6,v];
                         setpieza(6,v, 0);
                         setPieza(8,v, auxPie);
                         last.h := 7;
                     end
                  else
                     begin
                         auxPie := table[4,v];
                         setpieza(4,v, 0);
                         setPieza(1,v, auxPie);
                         last.h := 3;
                     end;
                  movOOO[h,v] := false;
                  Pieza := table[last.h,v];
                  setPieza(last.h,v, 0);
                  setPieza(h,v, Pieza);
               end
            else
               begin
                  h := ord(aJug[6])-96;
                  v := ord(aJug[7])-48;
                  Pieza := table[h,v];
                  setPieza(h,v, 0);
                  setPieza(h,v, valPie(aJug[5]));
                  last.h := h; last.v := v;
                  h := ord(aJug[2])-96;
                  v := ord(aJug[3])-48;
                  setPieza(h,v, Pieza);
               end;
            setMouse(On);
            setPos(12);
            if turno=negras then turno:=blancas
            else turno:=negras;
            if turno=negras then dec(nTurno);
            msgTurno;
            if jMate then jMate := false;
            wTurno;
            selec := false;
            noBack := false;
       end;
end; { backJug }

Procedure newGame;
begin
     setMouse(off);
     setFillStyle(1,7); Bar(420,175,590,340);
     for i:=1 to 8 do for j:=1 to 8 do
       if (movOOO[i,j]) and (table[i,j]<>0) then
          setPieza(i,j,0);
     setMouse(on);
     with posCur do
        if (h+v) mod 2 <> 0 then SetPos(bCol)
        else SetPos(nCol);
     initGame; msgTurno;
end; { Undo }


Procedure Nuevo_;
begin posToolb := 1; end;

Procedure Deshacer_;
begin posToolb := 2; end;

Procedure creditos_;
begin posToolb := 3; end;

Procedure Salir_;
begin posToolb := 4; end;

Procedure InitToolBar;
Begin
     Toolb.Init;
     With Toolb do
       begin
            Push(' Nuevo ', 15,24, Nuevo_, Size+1);
            Push(' Deshacer ', 15+23,24, Deshacer_, Size+1);
            Push(' Acerca de... ', 15+46,24, Creditos_, Size+1);
            Push(' Salir ', 15+69,24, Salir_, Size+1);
       end;
End; { InitToolBar }


Procedure Creditos;
const
    credit : array[0..3] of string[36] = (
             'Universidad Nacional del Santa',
             'Ingenier¡a de Sistemas e Inform tica',
             'Por: Jimmy Anthony Aguilar Olgu¡n',
             'jimmyao@terra.com.pe');
Var Tamano,i,j   : Integer;
    PuntBox      : Pointer;
    mclick       : Boolean;
begin
     cinwin := 0; photo := true;
     Tamano := ImageSize(210,120,430,380);
     GetMem(PuntBox, Tamano);
     SetMouse(Off);
     GetImage(210,120,430,380, PuntBox^);
     BotonWin(bNormal, 210,120,430,380, Off,'');
     InText3D(214,124,426,376, 0);
     getBMP16('credits.log',215,125,0); photo := false;
     SetColor(10); SetTextStyle(2,HorizDir,4); SetTextJustify(LeftText,TopText);
     setBorderMouse(220,133,420,353);
     setModyMouse(reloj); setMouse(On);
     i := 0;
     mclick := false;
     repeat
        for j:=1 to (Length(credit[i])) do
           begin
                outTextXY( 219+TextWidth(copy(credit[i],1,j-1)),360,
                           credit[i][j]);
                Delay(80);
                if keypressed then break;
                if clickMouse then mclick := true;
                if mclick then break;
                If credit[i][j]<>' ' then Sound(100); Delay(20);
                noSound;
           end;
        if keypressed then break;
        if clickMouse then mclick := true;
        if mclick then break;
        delay(250);
        setfillstyle(1,0); bar(215,362,424,372);
        if i=3 then i:=0 else inc(i);
     Until keyPressed or mclick;
     while keypressed do readkey;
     setMouse(Off); PutImage(210,120,PuntBox^,Normalput);
     FreeMem(PuntBox, Tamano);
     setModyMouse(flecha); SetMouse(On);
     setBorderMouse(0,0,640,480);
end;

{ ------------------------------ Principal -------------------------------- }

Begin
     initChess;
     InitToolBar;
     ONtBar := false;
     with PosCur do
     Repeat
         if not keyPressed then
            begin
                GetStatusMouse;
                Click := ClickMouse;
                with status do
                if (posX>=40) and (posX<=39+(40*8)) and
                   (posY>=90) and (posY<=89+(40*8)) then
                   begin
                   SetModyMouse(Indice); setMouse(on);
                   if click then
                      begin
                           if (h+v) mod 2 <> 0 then SetPos(bCol)
                           else SetPos(nCol);
                           h := 1 + (posX - 40) div 40;
                           v := 8 - ((posY - 90) div 40);
                           if selec then popPieza
                           else pushPieza;
                           setPos(12);
                      end;
                   end
                else
                   begin
                   SetModyMouse(flecha);setMouse(On);
                   if (posX in [15..126]) and (posY in [24..46]) then
                      begin
                        if not ONtBar then setToolBar(On);
                        ONtBar := true;
                      end
                   else
                      begin
                        if ONtBar then setToolBar(Off);
                        ONtBar := false;
                      end;
                   end;
                if posToolb in [1..4] then
                   begin
                       if ONtBar then setToolBar(Off);
                       ONtBar := false;
                       case posToolb of
                          1 : newGame;
                          2 : if noBack then backJug;
                          3 : creditos;
                          4 : salir := true;
                       end;
                       posToolb := 0;
                   end;
            end
         else
            begin
                Key := upCase(ReadKey);
                if Key=#0 then
                  begin
                     Key := ReadKey;
                     if key=#59 then Creditos;
                     SetMouse(Off);
                     if (h+v) mod 2 <> 0 then SetPos(bCol)
                     else SetPos(nCol);
                     Case key of
                         #72: if v<8 then inc(v) else v:=1;
                         #80: if v>1 then dec(v) else v:=8;
                         #77: if h<8 then inc(h) else h:=1;
                         #75: if h>1 then dec(h) else h:=8;
                         #71: if (v<8) and (h>1) then
                                begin inc(v); dec(h) end; { Inicio }
                         #79: if (v>1) and (h>1) then
                                begin dec(v); dec(h) end; { Fin }
                         #73: if (v<8) and (h<8) then
                                begin inc(v); inc(h) end; { Page Up }
                         #81: if (v>1) and (h<8) then
                                begin dec(v); inc(h) end; { Page Down }
                     end;
                     setPos(12);
                     SetMouse(On);
                  end
                else
                  Case Key of
                      ^N  : newGame;
                      ^Z  : if noBack then backJug
                            else beep(400,80);
                      #27 : Salir := true;
                      #13 : if selec then popPieza
                                     else pushPieza;
                  end;
            end
     Until Salir;
     if ONtBar then setToolBar(Off);
     exitChess;
End. { ChessTwo }