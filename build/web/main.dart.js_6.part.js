((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,E,D,G,B={
av0(){return new B.k8(null)},
api(d){var x=J.lV(d,new B.a8f(),y.y)
x=A.Y(x,x.$ti.h("ao.E"))
x.$flags=1
return x},
aB_(d,e){var x
if(d===e)return!0
if(e==null||d.length!==e.length)return!1
for(x=0;x<d.length;++x)if(!A.os(d[x],e[x]))return!1
return!0},
k8:function k8(d){this.a=d},
Jy:function Jy(d){var _=this
_.e=_.d=null
_.f=$
_.dA$=d
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
qK:function qK(d,e){this.c=d
this.a=e},
a8g:function a8g(d){this.a=d},
BT:function BT(){}},F
J=c[1]
A=c[0]
C=c[2]
E=c[7]
D=c[11]
G=c[9]
B=a.updateHolder(c[5],B)
F=c[10]
B.k8.prototype={
aj(){return new B.Jy(null)}}
B.Jy.prototype={
ao(){this.W3()
this.pH()},
pH(){var x=0,w=A.O(y.v),v=1,u=[],t=this,s,r,q,p,o,n,m,l,k,j
var $async$pH=A.P(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:v=3
x=6
return A.R(E.Ro("academic_service_list.json"),$async$pH)
case 6:s=e
r=B.api(s)
if(t.c!=null)t.al(new B.a8b(t,r))
v=1
x=5
break
case 3:v=2
k=u.pop()
q=A.a9(k)
if(t.c!=null)t.al(new B.a8c(t,q))
x=5
break
case 2:x=1
break
case 5:v=8
l=t.f
x=11
return A.R((l===$?t.f=$.ahV():l).w8("academic_service_list.json"),$async$pH)
case 11:p=e
o=B.api(p)
if(t.c!=null&&!B.aB_(o,t.d))t.al(new B.a8d(t,o))
v=1
x=10
break
case 8:v=7
j=u.pop()
n=A.a9(j)
if(t.c!=null&&t.d==null)t.al(new B.a8e(t,n))
x=10
break
case 7:x=1
break
case 10:return A.M(null,w)
case 1:return A.L(u.at(-1),w)}})
return A.N($async$pH,w)},
gla(){return!0},
L(d){var x,w,v=null
this.p5(d)
x=A.W(d).ok.w
x.toString
x=A.jk(v,F.Ct,v,v,A.cP("Academic Service",x),v)
w=A.W(d).a6.y
w=w==null?v:w.V(d.a9(y.o).w).a
return A.tI(A.kl(A.c([x,G.Ur(w==null?16:w),E.alO(C.cj,new A.eN(this.Xu(d),v),C.dk,C.b0)],y.u),C.bw,C.as,C.aR),v)},
Xu(d){var x,w,v,u=null,t=this.d
if(t!=null){x=E.ans(new B.a89(t),t.length,C.ap,D.r4,!0)
w=D.xb}else{v=this.e
if(v!=null){x=new A.cc(D.eJ,A.ke(A.kl(A.c([D.ly,A.cP(J.cf(v),u)],y.u),C.aZ,C.as,C.aR),u,u),u)
w=D.xc}else{x=D.rc
w=D.xd}}return E.CU(new A.fb(x,w),C.eH,new B.a8a(),C.hG,C.cq,E.ah_())}}
B.qK.prototype={
L(d){var x,w,v,u,t,s=null,r=this.c,q=r.i(0,"role"),p=q==null?s:J.cf(q)
if(p==null)p="Service"
q=r.i(0,"organization")
x=q==null?s:J.cf(q)
q=r.i(0,"location")
w=q==null?s:J.cf(q)
r=r.i(0,"year")
v=r==null?s:J.cf(r)
r=y.x
q=A.c([],r)
if(x!=null&&x.length!==0)q.push(x)
if(w!=null&&w.length!==0)q.push(w)
r=A.c([],r)
if(q.length!==0)r.push(C.b.b6(q,"  "))
u=C.b.b6(r,"\n")
r=A.cP(p,s)
q=u.length!==0?A.cP(u,A.W(d).ok.z):s
t=v!=null&&v.length!==0?A.cP(v,A.W(d).ok.as):s
return A.jk(s,s,new B.a8g(this),q,r,t)}}
B.BT.prototype={
ao(){this.aM()
this.ln()},
cD(){var x=this.dA$
if(x!=null){x.az()
x.ds()
this.dA$=null}this.k6()}}
var z=a.updateTypes(["qK(U,o)"])
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
$2(d,e){return new B.qK(this.a[e],null)},
$S:z+0}
B.a8a.prototype={
$2(d,e){var x=A.Y(e,y.l)
if(d!=null)x.push(d)
return A.jG(C.cj,x,C.cO)},
$S:164}
B.a8f.prototype={
$1(d){return y.B.a(d).fg(0,y.w,y.b)},
$S:165}
B.a8g.prototype={
$0(){var x=this.a.c.i(0,"link"),w=x==null?null:J.cf(x)
if(w!=null&&w.length!==0)A.Rn(A.ec(w,0,null))},
$S:0};(function aliases(){var x=B.BT.prototype
x.W3=x.ao})();(function inheritance(){var x=a.mixinHard,w=a.inherit,v=a.inheritMany
w(B.k8,A.a_)
w(B.BT,A.a7)
w(B.Jy,B.BT)
v(A.j0,[B.a8b,B.a8c,B.a8d,B.a8e,B.a8g])
v(A.kh,[B.a89,B.a8a])
w(B.a8f,A.fv)
w(B.qK,A.as)
x(B.BT,A.iV)})()
A.rL(b.typeUniverse,JSON.parse('{"qK":{"as":[],"f":[]},"k8":{"a_":[],"f":[]},"Jy":{"a7":["k8"]}}'))
var y={o:A.a3("dM"),x:A.a3("x<p>"),u:A.a3("x<f>"),y:A.a3("ax<p,@>"),B:A.a3("ax<@,@>"),w:A.a3("p"),l:A.a3("f"),b:A.a3("@"),v:A.a3("~")};(function constants(){F.Ci=new A.e1(59078,"MaterialIcons",!1)
F.Ct=new A.fy(F.Ci,null,null,null)})()};
(a=>{a["1iqioC/fovQtFMfhKrnTUhdxg7s="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.dart.js_6.part.js.map
