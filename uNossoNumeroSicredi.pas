unit uNossoNumeroSicredi;

interface
  uses
  System.SysUtils;

  type TNossoNumeroSicredi = class
       private
         { private declarations }
       protected
         { protected declarations }
       public
         { public declarations }
         function nossonumero(ag,Posto,cc,ano,byte,numero:Integer):string;
       published
         { published declarations }
       end;

implementation

{ TNossoNumeroSicredi }

function TNossoNumeroSicredi.nossonumero(ag, Posto, cc, ano, byte,
  numero: Integer): string;
  var
  Tag,
  Tposto,
  Tcc,
  Tano,
  Tbyte,
  Tnumero:string;
  produto, x :Real;
begin
  // zera a varialvel do produto
  produto := 0;
  // formata os dados
  Tag    := FormatFloat('0000',ag);
  Tposto := FormatFloat('00',Posto);
  Tcc    := FormatFloat('00000',cc);
  Tano   := FormatFloat('00',ano);
  Tbyte  := FormatFloat('0',byte);
  Tnumero:= FormatFloat('00000',numero);

  // Agencia
  produto := produto + (StrToInt(Copy(Tag,1,1)) * 4);
  produto := produto + (StrToInt(Copy(Tag,2,1)) * 3);
  produto := produto + (StrToInt(Copy(Tag,3,1)) * 2);
  produto := produto + (StrToInt(Copy(Tag,4,1)) * 9);

  // Posto
  produto := produto + (StrToInt(Copy(Tposto,1,1)) * 8);
  produto := produto + (StrToInt(Copy(Tposto,2,1)) * 7);

  //Cedente
  produto := produto + (StrToInt(Copy(Tcc,1,1)) * 6);
  produto := produto + (StrToInt(Copy(Tcc,2,1)) * 5);
  produto := produto + (StrToInt(Copy(Tcc,3,1)) * 4);
  produto := produto + (StrToInt(Copy(Tcc,4,1)) * 3);
  produto := produto + (StrToInt(Copy(Tcc,5,1)) * 2);

  //Ano
  produto := produto + (StrToInt(Copy(Tano,1,1)) * 9);
  produto := produto + (StrToInt(Copy(Tano,2,1)) * 8);

  //Byte
  produto := produto + (StrToInt(Copy(Tbyte,1,1)) * 7);

  //C
  produto := produto + (StrToInt(Copy(Tnumero,1,1)) * 6);
  produto := produto + (StrToInt(Copy(Tnumero,2,1)) * 5);
  produto := produto + (StrToInt(Copy(Tnumero,3,1)) * 4);
  produto := produto + (StrToInt(Copy(Tnumero,4,1)) * 3);
  produto := produto + (StrToInt(Copy(Tnumero,5,1)) * 2);

  // soma
  x := produto /  11;
  x := trunc(x) * 11;
  x := produto - x;
  x := 11 - x;

  // trunca o valor so para ter certeza que o valor vai ser um inteiro
  x := trunc(x);

  // valida se for maior que 9 o valor deve ser zero
  if x > 9 then
  begin
    x := 0;
  end;


  Result := Tano+'/'+Tbyte+Tnumero+'-'+FormatFloat('0',x);
end;

end.
teste wayssoft
