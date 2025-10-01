((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,B,C,E,D,G,A={
av6(){return new A.k1(null)},
apx(d){var x=J.lS(d,new A.a8c(),y.y)
x=B.Z(x,x.$ti.h("an.E"))
x.$flags=1
return x},
aBc(d,e){var x
if(d===e)return!0
if(e==null||d.length!==e.length)return!1
for(x=0;x<d.length;++x)if(!B.ow(d[x],e[x]))return!1
return!0},
k1:function k1(d){this.a=d},
Jq:function Jq(d){var _=this
_.e=_.d=null
_.f=$
_.dz$=d
_.c=_.a=null},
a88:function a88(d,e){this.a=d
this.b=e},
a89:function a89(d,e){this.a=d
this.b=e},
a8a:function a8a(d,e){this.a=d
this.b=e},
a8b:function a8b(d,e){this.a=d
this.b=e},
a86:function a86(d){this.a=d},
a87:function a87(){},
a8c:function a8c(){},
qT:function qT(d,e){this.c=d
this.a=e},
a8d:function a8d(d){this.a=d},
BM:function BM(){}},F
J=c[1]
B=c[0]
C=c[2]
E=c[7]
D=c[12]
G=c[10]
A=a.updateHolder(c[5],A)
F=c[11]
A.k1.prototype={
ak(){return new A.Jq(null)}}
A.Jq.prototype={
ao(){this.VJ()
this.pE()},
pE(){var x=0,w=B.P(y.v),v=1,u=[],t=this,s,r,q,p,o,n,m,l,k,j
var $async$pE=B.K(function(d,e){if(d===1){u.push(e)
x=v}while(true)switch(x){case 0:v=3
x=6
return B.T(E.Ri("academic_service_list.json"),$async$pE)
case 6:s=e
r=A.apx(s)
if(t.c!=null)t.am(new A.a88(t,r))
v=1
x=5
break
case 3:v=2
k=u.pop()
q=B.aa(k)
if(t.c!=null)t.am(new A.a89(t,q))
x=5
break
case 2:x=1
break
case 5:v=8
l=t.f
x=11
return B.T((l===$?t.f=$.ai5():l).w6("academic_service_list.json"),$async$pE)
case 11:p=e
o=A.apx(p)
if(t.c!=null&&!A.aBc(o,t.d))t.am(new A.a8a(t,o))
v=1
x=10
break
case 8:v=7
j=u.pop()
n=B.aa(j)
if(t.c!=null&&t.d==null)t.am(new A.a8b(t,n))
x=10
break
case 7:x=1
break
case 10:return B.N(null,w)
case 1:return B.M(u.at(-1),w)}})
return B.O($async$pE,w)},
gl4(){return!0},
L(d){var x,w,v=null
this.oW(d)
x=B.U(d).ok.w
x.toString
x=B.kz(v,F.Cg,v,v,B.cZ("Academic Service",x),v)
w=B.U(d).a7.y
w=w==null?v:w.T(d.aa(y.o).w).a
return B.tG(B.kf(B.c([x,G.Uf(w==null?16:w),E.am1(C.ce,new B.eO(this.Xe(d),v),C.de,C.aW)],y.u),C.bv,C.ap,C.aP),v)},
Xe(d){var x,w,v,u=null,t=this.d
if(t!=null){x=E.anI(new A.a86(t),t.length,C.at,D.qV,!0)
w=D.x0}else{v=this.e
if(v!=null){x=new B.cb(D.ez,B.k9(B.kf(B.c([D.ll,B.cZ(J.ce(v),u)],y.u),C.aU,C.ap,C.aP),u,u),u)
w=D.x1}else{x=D.r1
w=D.x2}}return E.CN(new B.fc(x,w),C.ey,new A.a87(),C.kU,C.cj,E.ah5())}}
A.qT.prototype={
L(d){var x,w,v,u,t,s=null,r=this.c,q=r.i(0,"role"),p=q==null?s:J.ce(q)
if(p==null)p="Service"
q=r.i(0,"organization")
x=q==null?s:J.ce(q)
q=r.i(0,"location")
w=q==null?s:J.ce(q)
r=r.i(0,"year")
v=r==null?s:J.ce(r)
r=y.x
q=B.c([],r)
if(x!=null&&x.length!==0)q.push(x)
if(w!=null&&w.length!==0)q.push(w)
r=B.c([],r)
if(q.length!==0)r.push(C.b.b7(q,"  "))
u=C.b.b7(r,"\n")
r=B.cZ(p,s)
q=u.length!==0?B.cZ(u,B.U(d).ok.z):s
t=v!=null&&v.length!==0?B.cZ(v,B.U(d).ok.as):s
return B.kz(s,s,new A.a8d(this),q,r,t)}}
A.BM.prototype={
ao(){this.aM()
this.lh()},
co(){var x=this.dz$
if(x!=null){x.aB()
x.dr()
this.dz$=null}this.k0()}}
var z=a.updateTypes(["qT(W,n)"])
A.a88.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
A.a89.prototype={
$0(){this.a.e=this.b},
$S:0}
A.a8a.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
A.a8b.prototype={
$0(){this.a.e=this.b},
$S:0}
A.a86.prototype={
$2(d,e){return new A.qT(this.a[e],null)},
$S:z+0}
A.a87.prototype={
$2(d,e){var x=B.Z(e,y.l)
if(d!=null)x.push(d)
return B.jA(C.ce,x,C.cH)},
$S:127}
A.a8c.prototype={
$1(d){return y.B.a(d).fb(0,y.w,y.b)},
$S:119}
A.a8d.prototype={
$0(){var x=this.a.c.i(0,"link"),w=x==null?null:J.ce(x)
if(w!=null&&w.length!==0)E.ahF(B.ex(w,0,null))},
$S:0};(function aliases(){var x=A.BM.prototype
x.VJ=x.ao})();(function inheritance(){var x=a.mixinHard,w=a.inherit,v=a.inheritMany
w(A.k1,B.a_)
w(A.BM,B.a7)
w(A.Jq,A.BM)
v(B.iY,[A.a88,A.a89,A.a8a,A.a8b,A.a8d])
v(B.hW,[A.a86,A.a87])
w(A.a8c,B.f3)
w(A.qT,B.aq)
x(A.BM,B.iU)})()
B.ol(b.typeUniverse,JSON.parse('{"qT":{"aq":[],"f":[]},"k1":{"a_":[],"f":[]},"Jq":{"a7":["k1"]}}'))
var y={o:B.a1("dK"),x:B.a1("x<p>"),u:B.a1("x<f>"),y:B.a1("av<p,@>"),B:B.a1("av<@,@>"),w:B.a1("p"),l:B.a1("f"),b:B.a1("@"),v:B.a1("~")};(function constants(){F.C5=new B.dY(59078,"MaterialIcons",!1)
F.Cg=new B.fC(F.C5,null,null,null)})()};
(a=>{a["FunJrOpopsrjR/DXqKq428waG80="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.dart.js_7.part.js.map
