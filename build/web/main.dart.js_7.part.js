((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,E,D,G,B={
aw0(){return new B.kd(null)},
aqg(d){var x=J.m1(d,new B.a9_(),y.y)
x=A.Y(x,x.$ti.h("an.E"))
x.$flags=1
return x},
aC4(d,e){var x
if(d===e)return!0
if(e==null||d.length!==e.length)return!1
for(x=0;x<d.length;++x)if(!A.lY(d[x],e[x]))return!1
return!0},
kd:function kd(d){this.a=d},
JW:function JW(d){var _=this
_.e=_.d=null
_.f=$
_.dE$=d
_.c=_.a=null},
a8W:function a8W(d,e){this.a=d
this.b=e},
a8X:function a8X(d,e){this.a=d
this.b=e},
a8Y:function a8Y(d,e){this.a=d
this.b=e},
a8Z:function a8Z(d,e){this.a=d
this.b=e},
a8U:function a8U(d){this.a=d},
a8V:function a8V(){},
a9_:function a9_(){},
qZ:function qZ(d,e){this.c=d
this.a=e},
a90:function a90(d){this.a=d},
Ca:function Ca(){}},F
J=c[1]
A=c[0]
C=c[2]
E=c[7]
D=c[12]
G=c[10]
B=a.updateHolder(c[5],B)
F=c[11]
B.kd.prototype={
aj(){return new B.JW(null)}}
B.JW.prototype={
an(){this.Wy()
this.pR()},
pR(){var x=0,w=A.M(y.v),v=1,u=[],t=this,s,r,q,p,o,n,m,l,k,j
var $async$pR=A.N(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:v=3
x=6
return A.R(E.RS("academic_service_list.json"),$async$pR)
case 6:s=e
r=B.aqg(s)
if(t.c!=null)t.al(new B.a8W(t,r))
v=1
x=5
break
case 3:v=2
k=u.pop()
q=A.aa(k)
if(t.c!=null)t.al(new B.a8X(t,q))
x=5
break
case 2:x=1
break
case 5:v=8
l=t.f
x=11
return A.R((l===$?t.f=$.aiS():l).wi("academic_service_list.json"),$async$pR)
case 11:p=e
o=B.aqg(p)
if(t.c!=null&&!B.aC4(o,t.d))t.al(new B.a8Y(t,o))
v=1
x=10
break
case 8:v=7
j=u.pop()
n=A.aa(j)
if(t.c!=null&&t.d==null)t.al(new B.a8Z(t,n))
x=10
break
case 7:x=1
break
case 10:return A.K(null,w)
case 1:return A.J(u.at(-1),w)}})
return A.L($async$pR,w)},
glg(){return!0},
L(d){var x,w,v=null
this.pc(d)
x=A.W(d).ok.w
x.toString
x=A.jp(v,F.CA,v,v,A.cQ("Academic Service",x),v)
w=A.W(d).a6.y
w=w==null?v:w.V(d.aa(y.o).w).a
return A.tV(A.kq(A.c([x,G.UU(w==null?16:w),E.amL(C.cj,new A.eV(this.Y3(d),v),C.dk,C.b0)],y.u),C.bx,C.as,C.aR),v)},
Y3(d){var x,w,v,u=null,t=this.d
if(t!=null){x=E.aop(new B.a8U(t),t.length,C.ap,D.ra,!0)
w=D.xi}else{v=this.e
if(v!=null){x=new A.ce(D.eK,A.kl(A.kq(A.c([D.lA,A.cQ(J.ch(v),u)],y.u),C.aZ,C.as,C.aR),u,u),u)
w=D.xj}else{x=D.rj
w=D.xk}}return E.Db(new A.fk(x,w),C.eI,new B.a8V(),C.hG,C.cr,E.ahV())}}
B.qZ.prototype={
L(d){var x,w,v,u,t,s=null,r=this.c,q=r.i(0,"role"),p=q==null?s:J.ch(q)
if(p==null)p="Service"
q=r.i(0,"organization")
x=q==null?s:J.ch(q)
q=r.i(0,"location")
w=q==null?s:J.ch(q)
r=r.i(0,"year")
v=r==null?s:J.ch(r)
r=y.x
q=A.c([],r)
if(x!=null&&x.length!==0)q.push(x)
if(w!=null&&w.length!==0)q.push(w)
r=A.c([],r)
if(q.length!==0)r.push(C.b.b7(q,"  "))
u=C.b.b7(r,"\n")
r=A.cQ(p,s)
q=u.length!==0?A.cQ(u,A.W(d).ok.z):s
t=v!=null&&v.length!==0?A.cQ(v,A.W(d).ok.as):s
return A.jp(s,s,new B.a90(this),q,r,t)}}
B.Ca.prototype={
an(){this.aM()
this.lt()},
cE(){var x=this.dE$
if(x!=null){x.aC()
x.dA()
this.dE$=null}this.kb()}}
var z=a.updateTypes(["qZ(U,o)"])
B.a8W.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.a8X.prototype={
$0(){this.a.e=this.b},
$S:0}
B.a8Y.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.a8Z.prototype={
$0(){this.a.e=this.b},
$S:0}
B.a8U.prototype={
$2(d,e){return new B.qZ(this.a[e],null)},
$S:z+0}
B.a8V.prototype={
$2(d,e){var x=A.Y(e,y.l)
if(d!=null)x.push(d)
return A.jL(C.cj,x,C.cP)},
$S:126}
B.a9_.prototype={
$1(d){return y.B.a(d).fk(0,y.w,y.b)},
$S:125}
B.a90.prototype={
$0(){var x=this.a.c.i(0,"link"),w=x==null?null:J.ch(x)
if(w!=null&&w.length!==0)A.RR(A.ee(w,0,null))},
$S:0};(function aliases(){var x=B.Ca.prototype
x.Wy=x.an})();(function inheritance(){var x=a.mixinHard,w=a.inherit,v=a.inheritMany
w(B.kd,A.a_)
w(B.Ca,A.a6)
w(B.JW,B.Ca)
v(A.j5,[B.a8W,B.a8X,B.a8Y,B.a8Z,B.a90])
v(A.hW,[B.a8U,B.a8V])
w(B.a9_,A.eM)
w(B.qZ,A.ar)
x(B.Ca,A.j0)})()
A.ot(b.typeUniverse,JSON.parse('{"qZ":{"ar":[],"f":[]},"kd":{"a_":[],"f":[]},"JW":{"a6":["kd"]}}'))
var y={o:A.a1("dP"),x:A.a1("w<p>"),u:A.a1("w<f>"),y:A.a1("ax<p,@>"),B:A.a1("ax<@,@>"),w:A.a1("p"),l:A.a1("f"),b:A.a1("@"),v:A.a1("~")};(function constants(){F.Cp=new A.e3(59078,"MaterialIcons",!1)
F.CA=new A.fF(F.Cp,null,null,null)})()};
(a=>{a["l7Ol2RWlglmoxI3sECgEm365SVs="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.dart.js_7.part.js.map
