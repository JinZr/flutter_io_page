((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,E,D,B={
avB(){return new B.kc(null)},
apU(d){var x=J.m0(d,new B.a8F(),y.y)
x=A.Y(x,x.$ti.h("ao.E"))
x.$flags=1
return x},
aBC(d,e){var x
if(d===e)return!0
if(e==null||d.length!==e.length)return!1
for(x=0;x<d.length;++x)if(!A.oD(d[x],e[x]))return!1
return!0},
kc:function kc(d){this.a=d},
JN:function JN(d){var _=this
_.e=_.d=null
_.f=$
_.dB$=d
_.c=_.a=null},
a8B:function a8B(d,e){this.a=d
this.b=e},
a8C:function a8C(d,e){this.a=d
this.b=e},
a8D:function a8D(d,e){this.a=d
this.b=e},
a8E:function a8E(d,e){this.a=d
this.b=e},
a8z:function a8z(d){this.a=d},
a8A:function a8A(){},
a8F:function a8F(){},
qW:function qW(d,e){this.c=d
this.a=e},
a8G:function a8G(d){this.a=d},
C7:function C7(){}},F
J=c[1]
A=c[0]
C=c[2]
E=c[7]
D=c[10]
B=a.updateHolder(c[5],B)
F=c[9]
B.kc.prototype={
ai(){return new B.JN(null)}}
B.JN.prototype={
ao(){this.Wb()
this.pM()},
pM(){var x=0,w=A.O(y.v),v=1,u=[],t=this,s,r,q,p,o,n,m,l,k,j
var $async$pM=A.P(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:v=3
x=6
return A.R(E.RI("academic_service_list.json"),$async$pM)
case 6:s=e
r=B.apU(s)
if(t.c!=null)t.ak(new B.a8B(t,r))
v=1
x=5
break
case 3:v=2
k=u.pop()
q=A.aa(k)
if(t.c!=null)t.ak(new B.a8C(t,q))
x=5
break
case 2:x=1
break
case 5:v=8
l=t.f
x=11
return A.R((l===$?t.f=$.aiu():l).wd("academic_service_list.json"),$async$pM)
case 11:p=e
o=B.apU(p)
if(t.c!=null&&!B.aBC(o,t.d))t.ak(new B.a8D(t,o))
v=1
x=10
break
case 8:v=7
j=u.pop()
n=A.aa(j)
if(t.c!=null&&t.d==null)t.ak(new B.a8E(t,n))
x=10
break
case 7:x=1
break
case 10:return A.M(null,w)
case 1:return A.L(u.at(-1),w)}})
return A.N($async$pM,w)},
gld(){return!0},
K(d){var x,w,v=null
this.pa(d)
x=A.V(d).ok.r
x.toString
x=A.jm(v,F.CB,v,v,A.cl("Academic Service",x),v)
w=A.V(d).a7.y
w=w==null?v:w.U(d.aa(y.o).w).a
return A.tS(A.kr(A.c([x,A.EK(w==null?16:w),E.amm(C.cj,new A.eQ(this.XC(d),v),C.dl,C.b1)],y.u),C.by,C.al,C.aS),v)},
XC(d){var x,w,v,u=null,t=this.d
if(t!=null){x=E.ao1(new B.a8z(t),t.length,C.aj,D.ra,!0)
w=D.xe}else{v=this.e
if(v!=null){x=new A.ce(D.eK,A.kk(A.kr(A.c([D.lF,A.cl(J.ch(v),u)],y.u),C.aD,C.al,C.aS),u,u),u)
w=D.xf}else{x=D.ri
w=D.xg}}return E.D8(new A.fd(x,w),C.dp,new B.a8A(),C.hI,C.cq,E.ahB())}}
B.qW.prototype={
K(d){var x,w,v,u,t,s=null,r=this.c,q=r.i(0,"role"),p=q==null?s:J.ch(q)
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
if(q.length!==0)r.push(C.b.b6(q,"  "))
u=C.b.b6(r,"\n")
r=A.cl(p,s)
q=u.length!==0?A.cl(u,A.V(d).ok.z):s
t=v!=null&&v.length!==0?A.cl(v,A.V(d).ok.as):s
return A.jm(s,s,new B.a8G(this),q,r,t)}}
B.C7.prototype={
ao(){this.aN()
this.lq()},
cH(){var x=this.dB$
if(x!=null){x.aA()
x.dt()
this.dB$=null}this.ka()}}
var z=a.updateTypes(["qW(U,m)"])
B.a8B.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.a8C.prototype={
$0(){this.a.e=this.b},
$S:0}
B.a8D.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.a8E.prototype={
$0(){this.a.e=this.b},
$S:0}
B.a8z.prototype={
$2(d,e){return new B.qW(this.a[e],null)},
$S:z+0}
B.a8A.prototype={
$2(d,e){var x=A.Y(e,y.l)
if(d!=null)x.push(d)
return A.jK(C.cj,x,C.cP)},
$S:121}
B.a8F.prototype={
$1(d){return y.B.a(d).fh(0,y.w,y.b)},
$S:117}
B.a8G.prototype={
$0(){var x=this.a.c.i(0,"link"),w=x==null?null:J.ch(x)
if(w!=null&&w.length!==0)A.RH(A.ef(w,0,null))},
$S:0};(function aliases(){var x=B.C7.prototype
x.Wb=x.ao})();(function inheritance(){var x=a.mixinHard,w=a.inherit,v=a.inheritMany
w(B.kc,A.Z)
w(B.C7,A.a6)
w(B.JN,B.C7)
v(A.j1,[B.a8B,B.a8C,B.a8D,B.a8E,B.a8G])
v(A.kn,[B.a8z,B.a8A])
w(B.a8F,A.fv)
w(B.qW,A.at)
x(B.C7,A.iW)})()
A.BP(b.typeUniverse,JSON.parse('{"qW":{"at":[],"f":[]},"kc":{"Z":[],"f":[]},"JN":{"a6":["kc"]}}'))
var y={o:A.a3("dP"),x:A.a3("x<p>"),u:A.a3("x<f>"),y:A.a3("az<p,@>"),B:A.a3("az<@,@>"),w:A.a3("p"),l:A.a3("f"),b:A.a3("@"),v:A.a3("~")};(function constants(){F.Cq=new A.dC(59078,"MaterialIcons",!1)
F.CB=new A.fz(F.Cq,null,null,null)})()};
(a=>{a["eZd9S7YSnTWhukhQ+Hffygh6HBI="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.dart.js_5.part.js.map
