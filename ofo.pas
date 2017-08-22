program ofo;
const t1=0.3;
      t2=0.6;
var a:array[1..10,1..10]of real;
    i,j,k,s:integer;
    b:array[1..100,1..100] of integer;

function check2(x,y:real):boolean;
   begin
      check2:=true;
      if abs(x-y)>t1 then check2:=false;
   end;

function choose(a,b,c:real):boolean;
   begin
      choose:=false;
      if(a<=0)and (b<=0) and (c>=0) then choose:=true;
      if(a<=0)and (b>=0) and (c<=0) then choose:=true;
      if(a>=0)and (b<=0) and (c<=0) then choose:=true;
   end;

procedure swap(var a,b:real);
var t:real;
   begin
      t:=a;
      a:=b;
      b:=t;
   end;


procedure find(var a,b,c:real);
    begin
    if a*b>0 then swap(a,c);
    if a*c>0 then swap(b,c);
    end;



function check3(a,b,c:real):boolean;
   begin
   check3:=false;
   if choose(a,b,c) then
      begin
      find(a,b,c);
      if check2(a,b) then
         if abs(a+b+c)<=t2 then check3:= true;
      end;
   end;

begin {main}
   assign(input,'a.txt');
   assign(output,'b.txt');
   reset(input);
   rewrite(output);
   s:=1;
   for i:=1 to 8 do
      for j:=1 to 8 do
       read(a[i,j]);
   for i:=1 to 8 do
      for j:= 1 to i do
         for k:=1  to j do
          if (i<>j)and(i<>k)and(j<>k) then
              if check3(a[i,j],a[i,k],a[j,k]) then
              begin
                 b[s,1]:=i;
                 b[s,2]:=j;
                 b[s,3]:=k;
                 s:=s+1;
              end;
   writeln(s-1);
   for i:=1 to s-1 do
      writeln(b[i,1],' ',b[i,2],' ',b[i,3]);
   close(input);
   close(output);
   end.












