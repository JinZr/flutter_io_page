((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,E,D,G,B={
aw5(){return new B.kf(null)},
aql(d){var x=J.m4(d,new B.a95(),y.y)
x=A.Y(x,x.$ti.h("an.E"))
x.$flags=1
return x},
aCa(d,e){var x
if(d===e)return!0
if(e==null||d.length!==e.length)return!1
for(x=0;x<d.length;++x)if(!A.m0(d[x],e[x]))return!1
return!0},
kf:function kf(d){this.a=d},
K0:function K0(d){var _=this
_.e=_.d=null
_.f=$
_.dE$=d
_.c=_.a=null},
a91:function a91(d,e){this.a=d
this.b=e},
a92:function a92(d,e){this.a=d
this.b=e},
a93:function a93(d,e){this.a=d
this.b=e},
a94:function a94(d,e){this.a=d
this.b=e},
a9_:function a9_(d){this.a=d},
a90:function a90(){},
a95:function a95(){},
r0:function r0(d,e){this.c=d
this.a=e},
a96:function a96(d){this.a=d},
Cb:function Cb(){}},F
J=c[1]
A=c[0]
C=c[2]
E=c[7]
D=c[12]
G=c[10]
B=a.updateHolder(c[5],B)
F=c[11]
B.kf.prototype={
ai(){return new B.K0(null)}}
B.K0.prototype={
an(){this.WB()
this.pS()},
pS(){var x=0,w=A.M(y.v),v=1,u=[],t=this,s,r,q,p,o,n,m,l,k,j
var $async$pS=A.N(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:v=3
x=6
return A.R(E.RY("academic_service_list.json"),$async$pS)
case 6:s=e
r=B.aql(s)
if(t.c!=null)t.al(new B.a91(t,r))
v=1
x=5
break
case 3:v=2
k=u.pop()
q=A.ab(k)
if(t.c!=null)t.al(new B.a92(t,q))
x=5
break
case 2:x=1
break
case 5:v=8
l=t.f
x=11
return A.R((l===$?t.f=$.aj_():l).wo("academic_service_list.json"),$async$pS)
case 11:p=e
o=B.aql(p)
if(t.c!=null&&!B.aCa(o,t.d))t.al(new B.a93(t,o))
v=1
x=10
break
case 8:v=7
j=u.pop()
n=A.ab(j)
if(t.c!=null&&t.d==null)t.al(new B.a94(t,n))
x=10
break
case 7:x=1
break
case 10:return A.K(null,w)
case 1:return A.J(u.at(-1),w)}})
return A.L($async$pS,w)},
glf(){return!0},
L(d){var x,w,v=null
this.pd(d)
x=A.V(d).ok.w
x.toString
x=A.js(v,F.CF,v,v,A.cH("Academic Service",x),v)
w=A.V(d).a6.y
w=w==null?v:w.V(d.aa(y.o).w).a
return A.tZ(A.j8(A.c([x,G.V0(w==null?16:w),E.amT(C.ck,new A.eV(this.Y7(d),v),C.dl,C.b0)],y.u),C.by,C.al,C.aT),v)},
Y7(d){var x,w,v,u=null,t=this.d
if(t!=null){x=E.aox(new B.a9_(t),t.length,C.ak,D.rb,!0)
w=D.xi}else{v=this.e
if(v!=null){x=new A.c2(D.eL,A.ko(A.j8(A.c([D.lC,A.cH(J.ci(v),u)],y.u),C.aQ,C.al,C.aT),u,u),u)
w=D.xj}else{x=D.rk
w=D.xk}}return E.Dd(new A.fk(x,w),C.eJ,new B.a90(),C.hH,C.bT,E.ai2())}}
B.r0.prototype={
L(d){var x,w,v,u,t,s=null,r=this.c,q=r.i(0,"role"),p=q==null?s:J.ci(q)
if(p==null)p="Service"
q=r.i(0,"organization")
x=q==null?s:J.ci(q)
q=r.i(0,"location")
w=q==null?s:J.ci(q)
r=r.i(0,"year")
v=r==null?s:J.ci(r)
r=y.x
q=A.c([],r)
if(x!=null&&x.length!==0)q.push(x)
if(w!=null&&w.length!==0)q.push(w)
r=A.c([],r)
if(q.length!==0)r.push(C.b.b7(q,"  "))
u=C.b.b7(r,"\n")
r=A.cH(p,s)
q=u.length!==0?A.cH(u,A.V(d).ok.z):s
t=v!=null&&v.length!==0?A.cH(v,A.V(d).ok.as):s
return A.js(s,s,new B.a96(this),q,r,t)}}
B.Cb.prototype={
an(){this.aK()
this.ls()},
cE(){var x=this.dE$
if(x!=null){x.aC()
x.dA()
this.dE$=null}this.kb()}}
var z=a.updateTypes(["r0(U,o)"])
B.a91.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.a92.prototype={
$0(){this.a.e=this.b},
$S:0}
B.a93.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.a94.prototype={
$0(){this.a.e=this.b},
$S:0}
B.a9_.prototype={
$2(d,e){return new B.r0(this.a[e],null)},
$S:z+0}
B.a90.prototype={
$2(d,e){var x=A.Y(e,y.l)
if(d!=null)x.push(d)
return A.iC(C.ck,x,C.cP)},
$S:125}
B.a95.prototype={
$1(d){return y.B.a(d).fk(0,y.w,y.b)},
$S:160}
B.a96.prototype={
$0(){var x=this.a.c.i(0,"link"),w=x==null?null:J.ci(x)
if(w!=null&&w.length!==0)A.RX(A.ee(w,0,null))},
$S:0};(function aliases(){var x=B.Cb.prototype
x.WB=x.an})();(function inheritance(){var x=a.mixinHard,w=a.inherit,v=a.inheritMany
w(B.kf,A.Z)
w(B.Cb,A.a6)
w(B.K0,B.Cb)
v(A.j6,[B.a91,B.a92,B.a93,B.a94,B.a96])
v(A.j7,[B.a9_,B.a90])
w(B.a95,A.fa)
w(B.r0,A.ar)
x(B.Cb,A.j1)})()
A.t1(b.typeUniverse,JSON.parse('{"r0":{"ar":[],"f":[]},"kf":{"Z":[],"f":[]},"K0":{"a6":["kf"]}}'))
var y={o:A.a3("e1"),x:A.a3("x<p>"),u:A.a3("x<f>"),y:A.a3("ax<p,@>"),B:A.a3("ax<@,@>"),w:A.a3("p"),l:A.a3("f"),b:A.a3("@"),v:A.a3("~")};(function constants(){F.Cu=new A.e3(59078,"MaterialIcons",!1)
F.CF=new A.fF(F.Cu,null,null,null)})()};
(a=>{a["452DnEbgYNLGMTkVXuSwmiQeTFA="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.dart.js_7.part.js.map
