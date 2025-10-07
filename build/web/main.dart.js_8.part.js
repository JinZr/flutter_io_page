((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,G,D,H,F,B={
avg(){return new B.k5(null)},
apH(d){var x=J.lU(d,new B.a8f(),y.y)
x=A.Y(x,x.$ti.h("an.E"))
x.$flags=1
return x},
aBm(d,e){var x
if(d===e)return!0
if(e==null||d.length!==e.length)return!1
for(x=0;x<d.length;++x)if(!A.ow(d[x],e[x]))return!1
return!0},
k5:function k5(d){this.a=d},
Jq:function Jq(d){var _=this
_.e=_.d=null
_.f=$
_.cU$=d
_.c=_.a=null},
a8b:function a8b(d,e){this.a=d
this.b=e},
a8c:function a8c(d,e){this.a=d
this.b=e},
a8d:function a8d(d,e){this.a=d
this.b=e},
a8e:function a8e(d,e){this.a=d
this.b=e},
a89:function a89(d){this.a=d},
a8a:function a8a(){},
a8f:function a8f(){},
qT:function qT(d,e){this.c=d
this.a=e},
a8g:function a8g(d){this.a=d},
BN:function BN(){}},E
J=c[1]
A=c[0]
C=c[2]
G=c[7]
D=c[13]
H=c[11]
F=c[10]
B=a.updateHolder(c[5],B)
E=c[12]
B.k5.prototype={
aj(){return new B.Jq(null)}}
B.Jq.prototype={
an(){this.VJ()
this.pE()},
pE(){var x=0,w=A.O(y.v),v=1,u=[],t=this,s,r,q,p,o,n,m,l,k,j
var $async$pE=A.K(function(d,e){if(d===1){u.push(e)
x=v}while(true)switch(x){case 0:v=3
x=6
return A.T(G.Rl("academic_service_list.json"),$async$pE)
case 6:s=e
r=B.apH(s)
if(t.c!=null)t.al(new B.a8b(t,r))
v=1
x=5
break
case 3:v=2
k=u.pop()
q=A.aa(k)
if(t.c!=null)t.al(new B.a8c(t,q))
x=5
break
case 2:x=1
break
case 5:v=8
l=t.f
x=11
return A.T((l===$?t.f=$.aif():l).w6("academic_service_list.json"),$async$pE)
case 11:p=e
o=B.apH(p)
if(t.c!=null&&!B.aBm(o,t.d))t.al(new B.a8d(t,o))
v=1
x=10
break
case 8:v=7
j=u.pop()
n=A.aa(j)
if(t.c!=null&&t.d==null)t.al(new B.a8e(t,n))
x=10
break
case 7:x=1
break
case 10:return A.M(null,w)
case 1:return A.L(u.at(-1),w)}})
return A.N($async$pE,w)},
gjV(){return!0},
L(d){var x,w,v=null
this.mK(d)
x=A.U(d).ok.w
x.toString
x=A.jf(v,E.Ch,v,v,A.cB("Academic Service",x),v)
w=A.U(d).a7.y
w=w==null?v:w.T(d.aa(y.o).w).a
return A.tH(A.iZ(A.c([x,H.Ui(w==null?16:w),F.aiE(C.bK,new A.et(this.WB(d),v),C.bR,C.aB)],y.u),C.b6,C.aj,C.aQ),v)},
WB(d){var x,w,v,u=null,t=this.d
if(t!=null){x=G.anU(new B.a89(t),t.length,C.at,D.qX,!0)
w=D.x2}else{v=this.e
if(v!=null){x=new A.c_(D.eA,A.kd(A.iZ(A.c([D.lo,A.cB(J.ce(v),u)],y.u),C.aV,C.aj,C.aQ),u,u),u)
w=D.x3}else{x=D.r3
w=D.x4}}return F.tk(new A.eP(x,w),C.ey,new B.a8a(),C.kX,C.ck,F.ahg())}}
B.qT.prototype={
L(d){var x,w,v,u,t,s=null,r=this.c,q=r.i(0,"role"),p=q==null?s:J.ce(q)
if(p==null)p="Service"
q=r.i(0,"organization")
x=q==null?s:J.ce(q)
q=r.i(0,"location")
w=q==null?s:J.ce(q)
r=r.i(0,"year")
v=r==null?s:J.ce(r)
r=y.x
q=A.c([],r)
if(x!=null&&x.length!==0)q.push(x)
if(w!=null&&w.length!==0)q.push(w)
r=A.c([],r)
if(q.length!==0)r.push(C.b.b7(q,"  "))
u=C.b.b7(r,"\n")
r=A.cB(p,s)
q=u.length!==0?A.cB(u,A.U(d).ok.z):s
t=v!=null&&v.length!==0?A.cB(v,A.U(d).ok.as):s
return A.jf(s,s,new B.a8g(this),q,r,t)}}
B.BN.prototype={
an(){this.aM()
this.kd()},
ci(){var x=this.cU$
if(x!=null){x.az()
x.de()
this.cU$=null}this.j7()}}
var z=a.updateTypes(["qT(W,n)"])
B.a8b.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.a8c.prototype={
$0(){this.a.e=this.b},
$S:0}
B.a8d.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.a8e.prototype={
$0(){this.a.e=this.b},
$S:0}
B.a89.prototype={
$2(d,e){return new B.qT(this.a[e],null)},
$S:z+0}
B.a8a.prototype={
$2(d,e){var x=A.Y(e,y.l)
if(d!=null)x.push(d)
return A.jD(C.bK,x,C.cI)},
$S:166}
B.a8f.prototype={
$1(d){return y.B.a(d).fb(0,y.w,y.b)},
$S:167}
B.a8g.prototype={
$0(){var x=this.a.c.i(0,"link"),w=x==null?null:J.ce(x)
if(w!=null&&w.length!==0)A.Rk(A.e9(w,0,null))},
$S:0};(function aliases(){var x=B.BN.prototype
x.VJ=x.an})();(function inheritance(){var x=a.mixinHard,w=a.inherit,v=a.inheritMany
w(B.k5,A.Z)
w(B.BN,A.a5)
w(B.Jq,B.BN)
v(A.h8,[B.a8b,B.a8c,B.a8d,B.a8e,B.a8g])
v(A.h9,[B.a89,B.a8a])
w(B.a8f,A.ei)
w(B.qT,A.at)
x(B.BN,A.hU)})()
A.jX(b.typeUniverse,JSON.parse('{"qT":{"at":[],"f":[]},"k5":{"Z":[],"f":[]},"Jq":{"a5":["k5"]}}'))
var y={o:A.a0("dy"),x:A.a0("x<o>"),u:A.a0("x<f>"),y:A.a0("ar<o,@>"),B:A.a0("ar<@,@>"),w:A.a0("o"),l:A.a0("f"),b:A.a0("@"),v:A.a0("~")};(function constants(){E.C6=new A.dY(59078,"MaterialIcons",!1)
E.Ch=new A.fD(E.C6,null,null,null)})()};
(a=>{a["TMb7ONNM+MBNeFDmlVTfSnTrQSU="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.dart.js_8.part.js.map
