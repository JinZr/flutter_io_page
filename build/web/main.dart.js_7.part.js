((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,E,D,G,B={
avd(){return new B.k6(null)},
apI(d){var x=J.lV(d,new B.a8k(),y.y)
x=A.Z(x,x.$ti.h("an.E"))
x.$flags=1
return x},
aBg(d,e){var x
if(d===e)return!0
if(e==null||d.length!==e.length)return!1
for(x=0;x<d.length;++x)if(!A.ou(d[x],e[x]))return!1
return!0},
k6:function k6(d){this.a=d},
Jv:function Jv(d){var _=this
_.e=_.d=null
_.f=$
_.dz$=d
_.c=_.a=null},
a8g:function a8g(d,e){this.a=d
this.b=e},
a8h:function a8h(d,e){this.a=d
this.b=e},
a8i:function a8i(d,e){this.a=d
this.b=e},
a8j:function a8j(d,e){this.a=d
this.b=e},
a8e:function a8e(d){this.a=d},
a8f:function a8f(){},
a8k:function a8k(){},
qU:function qU(d,e){this.c=d
this.a=e},
a8l:function a8l(d){this.a=d},
BM:function BM(){}},F
J=c[1]
A=c[0]
C=c[2]
E=c[7]
D=c[12]
G=c[10]
B=a.updateHolder(c[5],B)
F=c[11]
B.k6.prototype={
aj(){return new B.Jv(null)}}
B.Jv.prototype={
an(){this.VM()
this.pE()},
pE(){var x=0,w=A.O(y.v),v=1,u=[],t=this,s,r,q,p,o,n,m,l,k,j
var $async$pE=A.K(function(d,e){if(d===1){u.push(e)
x=v}while(true)switch(x){case 0:v=3
x=6
return A.T(E.Rp("academic_service_list.json"),$async$pE)
case 6:s=e
r=B.apI(s)
if(t.c!=null)t.al(new B.a8g(t,r))
v=1
x=5
break
case 3:v=2
k=u.pop()
q=A.aa(k)
if(t.c!=null)t.al(new B.a8h(t,q))
x=5
break
case 2:x=1
break
case 5:v=8
l=t.f
x=11
return A.T((l===$?t.f=$.aif():l).wb("academic_service_list.json"),$async$pE)
case 11:p=e
o=B.apI(p)
if(t.c!=null&&!B.aBg(o,t.d))t.al(new B.a8i(t,o))
v=1
x=10
break
case 8:v=7
j=u.pop()
n=A.aa(j)
if(t.c!=null&&t.d==null)t.al(new B.a8j(t,n))
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
x=A.ji(v,F.Ci,v,v,A.cC("Academic Service",x,v),v)
w=A.U(d).a8.y
w=w==null?v:w.T(d.aa(y.o).w).a
return A.tK(A.hY(A.c([x,G.Um(w==null?16:w),E.amc(C.cf,new A.eP(this.Xi(d),v),C.df,C.aW)],y.u),C.bw,C.ah,C.aD),v)},
Xi(d){var x,w,v,u=null,t=this.d
if(t!=null){x=E.anT(new B.a8e(t),t.length,C.ao,D.qX,!0)
w=D.x2}else{v=this.e
if(v!=null){x=new A.c_(D.eB,A.ke(A.hY(A.c([D.lo,A.cC(J.cf(v),u,u)],y.u),C.az,C.ah,C.aD),u,u),u)
w=D.x3}else{x=D.r3
w=D.x4}}return E.CO(new A.fd(x,w),C.ez,new B.a8f(),C.kW,C.bQ,E.ahg())}}
B.qU.prototype={
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
if(q.length!==0)r.push(C.b.b7(q,"  "))
u=C.b.b7(r,"\n")
r=A.cC(p,s,s)
q=u.length!==0?A.cC(u,A.U(d).ok.z,s):s
t=v!=null&&v.length!==0?A.cC(v,A.U(d).ok.as,s):s
return A.ji(s,s,new B.a8l(this),q,r,t)}}
B.BM.prototype={
an(){this.aM()
this.li()},
cq(){var x=this.dz$
if(x!=null){x.aB()
x.ds()
this.dz$=null}this.k6()}}
var z=a.updateTypes(["qU(W,n)"])
B.a8g.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.a8h.prototype={
$0(){this.a.e=this.b},
$S:0}
B.a8i.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.a8j.prototype={
$0(){this.a.e=this.b},
$S:0}
B.a8e.prototype={
$2(d,e){return new B.qU(this.a[e],null)},
$S:z+0}
B.a8f.prototype={
$2(d,e){var x=A.Z(e,y.l)
if(d!=null)x.push(d)
return A.iC(C.cf,x,C.cH)},
$S:127}
B.a8k.prototype={
$1(d){return y.B.a(d).fb(0,y.w,y.b)},
$S:119}
B.a8l.prototype={
$0(){var x=this.a.c.i(0,"link"),w=x==null?null:J.cf(x)
if(w!=null&&w.length!==0)A.Ro(A.e9(w,0,null))},
$S:0};(function aliases(){var x=B.BM.prototype
x.VM=x.an})();(function inheritance(){var x=a.mixinHard,w=a.inherit,v=a.inheritMany
w(B.k6,A.a_)
w(B.BM,A.a6)
w(B.Jv,B.BM)
v(A.j0,[B.a8g,B.a8h,B.a8i,B.a8j,B.a8l])
v(A.j1,[B.a8e,B.a8f])
w(B.a8k,A.f4)
w(B.qU,A.aq)
x(B.BM,A.iX)})()
A.rT(b.typeUniverse,JSON.parse('{"qU":{"aq":[],"f":[]},"k6":{"a_":[],"f":[]},"Jv":{"a6":["k6"]}}'))
var y={o:A.a2("dY"),x:A.a2("x<p>"),u:A.a2("x<f>"),y:A.a2("av<p,@>"),B:A.a2("av<@,@>"),w:A.a2("p"),l:A.a2("f"),b:A.a2("@"),v:A.a2("~")};(function constants(){F.Cd=new A.dM(59078,"MaterialIcons",!1)
F.Ci=new A.fD(F.Cd,null,null,null,null)})()};
(a=>{a["e6MI9TPDE+dCrGFV55mLk/6xIq4="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.dart.js_7.part.js.map
