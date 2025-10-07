((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,E,D,G,B={
av7(){return new B.k3(null)},
apy(d){var x=J.lS(d,new B.a8e(),y.y)
x=A.Z(x,x.$ti.h("an.E"))
x.$flags=1
return x},
aBd(d,e){var x
if(d===e)return!0
if(e==null||d.length!==e.length)return!1
for(x=0;x<d.length;++x)if(!A.ow(d[x],e[x]))return!1
return!0},
k3:function k3(d){this.a=d},
Jq:function Jq(d){var _=this
_.e=_.d=null
_.f=$
_.dz$=d
_.c=_.a=null},
a8a:function a8a(d,e){this.a=d
this.b=e},
a8b:function a8b(d,e){this.a=d
this.b=e},
a8c:function a8c(d,e){this.a=d
this.b=e},
a8d:function a8d(d,e){this.a=d
this.b=e},
a88:function a88(d){this.a=d},
a89:function a89(){},
a8e:function a8e(){},
qT:function qT(d,e){this.c=d
this.a=e},
a8f:function a8f(d){this.a=d},
BM:function BM(){}},F
J=c[1]
A=c[0]
C=c[2]
E=c[7]
D=c[12]
G=c[10]
B=a.updateHolder(c[5],B)
F=c[11]
B.k3.prototype={
ak(){return new B.Jq(null)}}
B.Jq.prototype={
ao(){this.VJ()
this.pE()},
pE(){var x=0,w=A.O(y.v),v=1,u=[],t=this,s,r,q,p,o,n,m,l,k,j
var $async$pE=A.K(function(d,e){if(d===1){u.push(e)
x=v}while(true)switch(x){case 0:v=3
x=6
return A.T(E.Rj("academic_service_list.json"),$async$pE)
case 6:s=e
r=B.apy(s)
if(t.c!=null)t.am(new B.a8a(t,r))
v=1
x=5
break
case 3:v=2
k=u.pop()
q=A.aa(k)
if(t.c!=null)t.am(new B.a8b(t,q))
x=5
break
case 2:x=1
break
case 5:v=8
l=t.f
x=11
return A.T((l===$?t.f=$.ai6():l).w6("academic_service_list.json"),$async$pE)
case 11:p=e
o=B.apy(p)
if(t.c!=null&&!B.aBd(o,t.d))t.am(new B.a8c(t,o))
v=1
x=10
break
case 8:v=7
j=u.pop()
n=A.aa(j)
if(t.c!=null&&t.d==null)t.am(new B.a8d(t,n))
x=10
break
case 7:x=1
break
case 10:return A.M(null,w)
case 1:return A.L(u.at(-1),w)}})
return A.N($async$pE,w)},
gl4(){return!0},
L(d){var x,w,v=null
this.oW(d)
x=A.U(d).ok.w
x.toString
x=A.je(v,F.Cg,v,v,A.cL("Academic Service",x),v)
w=A.U(d).a7.y
w=w==null?v:w.T(d.aa(y.o).w).a
return A.tG(A.kh(A.c([x,G.Ug(w==null?16:w),E.am2(C.ce,new A.eO(this.Xe(d),v),C.de,C.aW)],y.u),C.bv,C.ap,C.aP),v)},
Xe(d){var x,w,v,u=null,t=this.d
if(t!=null){x=E.anJ(new B.a88(t),t.length,C.at,D.qV,!0)
w=D.x0}else{v=this.e
if(v!=null){x=new A.cb(D.eA,A.kb(A.kh(A.c([D.ll,A.cL(J.ce(v),u)],y.u),C.aU,C.ap,C.aP),u,u),u)
w=D.x1}else{x=D.r1
w=D.x2}}return E.CN(new A.fd(x,w),C.ey,new B.a89(),C.kU,C.cj,E.ah7())}}
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
r=A.cL(p,s)
q=u.length!==0?A.cL(u,A.U(d).ok.z):s
t=v!=null&&v.length!==0?A.cL(v,A.U(d).ok.as):s
return A.je(s,s,new B.a8f(this),q,r,t)}}
B.BM.prototype={
ao(){this.aM()
this.lh()},
co(){var x=this.dz$
if(x!=null){x.aB()
x.dr()
this.dz$=null}this.k0()}}
var z=a.updateTypes(["qT(W,n)"])
B.a8a.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.a8b.prototype={
$0(){this.a.e=this.b},
$S:0}
B.a8c.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.a8d.prototype={
$0(){this.a.e=this.b},
$S:0}
B.a88.prototype={
$2(d,e){return new B.qT(this.a[e],null)},
$S:z+0}
B.a89.prototype={
$2(d,e){var x=A.Z(e,y.l)
if(d!=null)x.push(d)
return A.jC(C.ce,x,C.cH)},
$S:127}
B.a8e.prototype={
$1(d){return y.B.a(d).fb(0,y.w,y.b)},
$S:119}
B.a8f.prototype={
$0(){var x=this.a.c.i(0,"link"),w=x==null?null:J.ce(x)
if(w!=null&&w.length!==0)A.Ri(A.e9(w,0,null))},
$S:0};(function aliases(){var x=B.BM.prototype
x.VJ=x.ao})();(function inheritance(){var x=a.mixinHard,w=a.inherit,v=a.inheritMany
w(B.k3,A.a_)
w(B.BM,A.a7)
w(B.Jq,B.BM)
v(A.iY,[B.a8a,B.a8b,B.a8c,B.a8d,B.a8f])
v(A.hW,[B.a88,B.a89])
w(B.a8e,A.f4)
w(B.qT,A.aq)
x(B.BM,A.iU)})()
A.ol(b.typeUniverse,JSON.parse('{"qT":{"aq":[],"f":[]},"k3":{"a_":[],"f":[]},"Jq":{"a7":["k3"]}}'))
var y={o:A.a1("dK"),x:A.a1("x<p>"),u:A.a1("x<f>"),y:A.a1("av<p,@>"),B:A.a1("av<@,@>"),w:A.a1("p"),l:A.a1("f"),b:A.a1("@"),v:A.a1("~")};(function constants(){F.C5=new A.dY(59078,"MaterialIcons",!1)
F.Cg=new A.fD(F.C5,null,null,null)})()};
(a=>{a["FOTvIg2iMmJsUVtjTTQgtoMtfUs="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.dart.js_7.part.js.map
