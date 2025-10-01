((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,B,C,A={
bri(){return new A.N8(null)},
bh7(d){var x=J.O1(d,new A.aFF(),y.P)
x=B.a1(x,x.$ti.h("ap.E"))
x.$flags=1
return x},
bte(d,e){var x
if(d===e)return!0
if(e==null||d.length!==e.length)return!1
for(x=0;x<d.length;++x)if(!B.QB(d[x],e[x]))return!1
return!0},
N8:function N8(d){this.a=d},
aeF:function aeF(d){var _=this
_.e=_.d=null
_.f=$
_.dm$=d
_.c=_.a=null},
aFB:function aFB(d,e){this.a=d
this.b=e},
aFC:function aFC(d,e){this.a=d
this.b=e},
aFD:function aFD(d,e){this.a=d
this.b=e},
aFE:function aFE(d,e){this.a=d
this.b=e},
aFy:function aFy(){},
aFz:function aFz(d){this.a=d},
aFA:function aFA(){},
aFF:function aFF(){},
afh:function afh(d,e){this.c=d
this.a=e},
a2e:function a2e(){},
a88:function a88(d,e){this.c=d
this.a=e},
avO:function avO(d){this.a=d}},E,F,D,G
J=c[1]
B=c[0]
C=c[2]
A=a.updateHolder(c[3],A)
E=c[15]
F=c[8]
D=c[12]
G=c[10]
A.N8.prototype={
ai(){return new A.aeF(null)}}
A.aeF.prototype={
an(){this.VR()
this.pM()},
pM(){var x=0,w=B.S(y.H),v=1,u=[],t=[],s=this,r,q,p,o,n,m,l,k,j,i
var $async$pM=B.O(function(d,e){if(d===1){u.push(e)
x=v}while(true)switch(x){case 0:v=3
x=6
return B.V(F.ahp("selected_pub_list.json"),$async$pM)
case 6:r=e
q=A.bh7(r)
if(s.c!=null)s.aq(new A.aFB(s,q))
v=1
x=5
break
case 3:v=2
j=u.pop()
p=B.ac(j)
if(s.c!=null)s.aq(new A.aFC(s,p))
x=5
break
case 2:x=1
break
case 5:v=8
k=s.f
x=11
return B.V((k===$?s.f=$.aJ4():k).w0("selected_pub_list.json"),$async$pM)
case 11:o=e
n=A.bh7(o)
if(s.c!=null&&!A.bte(n,s.d))s.aq(new A.aFD(s,n))
t.push(10)
x=9
break
case 8:v=7
i=u.pop()
m=B.ac(i)
if(s.c!=null&&s.d==null)s.aq(new A.aFE(s,m))
t.push(10)
x=9
break
case 7:t=[1]
case 9:v=1
x=t.pop()
break
case 10:return B.Q(null,w)
case 1:return B.P(u.at(-1),w)}})
return B.R($async$pM,w)},
gkZ(){return!0},
L(d){var x,w,v=null
this.oR(d)
x=B.Z(d).ok.w
x.toString
x=B.MJ(v,E.Cj,v,v,B.du("Selected Publications",x),v)
w=B.Z(d).a6.y
w=w==null?v:w.W(d.ab(y.I).w).a
return B.UP(B.Ol(B.h([x,G.akr(w==null?16:w),F.aN0(C.ct,new B.I0(this.a3Y(d),v),C.eI,C.bo)],y.p),C.c4,C.aJ),v)},
a3Y(d){var x,w,v,u,t,s,r,q,p,o,n=null,m=this.d
if(m!=null){x=B.J2(m,0,B.NT(5,"count",y.S),B.Y(m).c).cL(0,!1)
w=B.z(y.N,y.D)
for(v=x.length,u=0;u<x.length;x.length===v||(0,B.F)(x),++u){t=x[u]
s=t.i(0,"theme")
r=s==null?n:J.ck(s)
if(r==null)r="Other"
J.Ic(w.b8(r,new A.aFy()),t)}q=B.h([],y.p)
w.a2(0,new A.aFz(q))
p=B.aOL(q,D.rc,!0)
o=D.xf}else{v=this.e
if(v!=null){p=new B.cz(D.eM,B.QX(B.Ol(B.h([D.lD,B.du(J.ck(v),n)],y.p),C.b5,C.aJ),n,n),n)
o=D.xg}else{p=D.rj
o=D.xh}}return F.aN1(new B.IQ(p,o),C.eL,new A.aFA(),C.lb,C.cy)}}
A.afh.prototype={
L(d){var x,w=null,v=B.Z(d).ax,u=v.RG
if(u==null)u=v.k2
v=B.Z(d).ok.x
x=v==null?w:v.a72(C.dz)
return B.ajE(B.du(this.c,x),u,w,w,w,D.eM,1/0)}}
A.a2e.prototype={
an(){this.aN()
this.lc()},
ck(){var x=this.dm$
if(x!=null){x.aw()
x.dj()
this.dm$=null}this.jX()}}
A.a88.prototype={
L(d){var x=null,w=this.c,v=B.du(w.i(0,"title"),C.x1)
return B.MJ(!0,x,new A.avO(this),B.du(w.i(0,"author"),x),v,B.Ol(B.h([B.du(w.i(0,"venue"),x),B.du(w.i(0,"year"),x)],y.p),C.cx,C.iH))}}
var z=a.updateTypes([])
A.aFB.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:1}
A.aFC.prototype={
$0(){this.a.e=this.b},
$S:1}
A.aFD.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:1}
A.aFE.prototype={
$0(){this.a.e=this.b},
$S:1}
A.aFy.prototype={
$0(){return B.h([],y.t)},
$S:489}
A.aFz.prototype={
$2(d,e){var x,w=this.a
w.push(new A.afh(d,null))
for(x=J.bh(e);x.n();)w.push(new A.a88(x.gJ(),null))},
$S:490}
A.aFA.prototype={
$2(d,e){var x=B.a1(e,y.l)
if(d!=null)x.push(d)
return B.LJ(C.ct,x,C.cX)},
$S:139}
A.aFF.prototype={
$1(d){return y.f.a(d).f4(0,y.N,y.z)},
$S:168}
A.avO.prototype={
$0(){F.aIC(B.eB(this.a.c.i(0,"link"),0,null))},
$S:1};(function aliases(){var x=A.a2e.prototype
x.VR=x.an})();(function inheritance(){var x=a.mixinHard,w=a.inherit,v=a.inheritMany
w(A.N8,B.a3)
w(A.a2e,B.ab)
w(A.aeF,A.a2e)
v(B.L6,[A.aFB,A.aFC,A.aFD,A.aFE,A.aFy,A.avO])
v(B.L7,[A.aFz,A.aFA])
w(A.aFF,B.Ig)
v(B.aw,[A.afh,A.a88])
x(A.a2e,B.L2)})()
B.Qt(b.typeUniverse,JSON.parse('{"N8":{"a3":[],"k":[]},"aeF":{"ab":["N8"]},"afh":{"aw":[],"k":[]},"a88":{"aw":[],"k":[]}}'))
var y=(function rtii(){var x=B.a5
return{I:x("dO"),t:x("B<av<t,@>>"),p:x("B<k>"),D:x("M<av<t,@>>"),P:x("av<t,@>"),f:x("av<@,@>"),N:x("t"),l:x("k"),z:x("@"),S:x("p"),H:x("~")}})();(function constants(){E.Cc=new B.en(984385,"MaterialIcons",!1)
E.Cj=new B.Js(E.Cc,null,null)})()};
(a=>{a["B9/Rr1Qn/oVcDmdttxx+ot6KOL8="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.dart.js_1.part.js.map
