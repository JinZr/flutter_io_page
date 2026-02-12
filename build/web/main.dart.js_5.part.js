((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,E,D,B={
awh(){return new B.kd(null)},
aqA(d){var x=J.m0(d,new B.a9b(),y.y)
x=A.Z(x,x.$ti.h("ap.E"))
x.$flags=1
return x},
aC9(d,e){var x
if(d===e)return!0
if(e==null||d.length!==e.length)return!1
for(x=0;x<d.length;++x)if(!A.oK(d[x],e[x]))return!1
return!0},
kd:function kd(d){this.a=d},
Kh:function Kh(d){var _=this
_.e=_.d=null
_.f=$
_.dE$=d
_.c=_.a=null},
a97:function a97(d,e){this.a=d
this.b=e},
a98:function a98(d,e){this.a=d
this.b=e},
a99:function a99(d,e){this.a=d
this.b=e},
a9a:function a9a(d,e){this.a=d
this.b=e},
a95:function a95(d){this.a=d},
a96:function a96(){},
a9b:function a9b(){},
r9:function r9(d,e){this.c=d
this.a=e},
a9c:function a9c(d){this.a=d},
Cp:function Cp(){}},F
J=c[1]
A=c[0]
C=c[2]
E=c[7]
D=c[10]
B=a.updateHolder(c[5],B)
F=c[9]
B.kd.prototype={
ag(){return new B.Kh(null)}}
B.Kh.prototype={
an(){this.Xt()
this.q5()},
q5(){var x=0,w=A.N(y.v),v=1,u=[],t=this,s,r,q,p,o,n,m,l,k,j
var $async$q5=A.O(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:v=3
x=6
return A.Q(E.Se("academic_service_list.json"),$async$q5)
case 6:s=e
r=B.aqA(s)
if(t.c!=null)t.al(new B.a97(t,r))
v=1
x=5
break
case 3:v=2
k=u.pop()
q=A.aa(k)
if(t.c!=null)t.al(new B.a98(t,q))
x=5
break
case 2:x=1
break
case 5:v=8
l=t.f
x=11
return A.Q((l===$?t.f=$.aj2():l).wG("academic_service_list.json"),$async$q5)
case 11:p=e
o=B.aqA(p)
if(t.c!=null&&!B.aC9(o,t.d))t.al(new B.a99(t,o))
v=1
x=10
break
case 8:v=7
j=u.pop()
n=A.aa(j)
if(t.c!=null&&t.d==null)t.al(new B.a9a(t,n))
x=10
break
case 7:x=1
break
case 10:return A.L(null,w)
case 1:return A.K(u.at(-1),w)}})
return A.M($async$q5,w)},
glp(){return!0},
K(d){var x,w,v=null
this.pr(d)
x=A.V(d).ok.r
x.toString
x=A.jm(v,F.CG,v,v,A.cm("Academic Service",x),v)
w=A.V(d).a7.y
w=w==null?v:w.V(d.a8(y.o).w).a
return A.u4(A.kq(A.d([x,A.F7(w==null?16:w),E.an_(C.co,new A.eQ(this.YU(d),v),C.dt,C.b5)],y.u),C.bB,C.an,C.aU),v)},
YU(d){var x,w,v,u=null,t=this.d
if(t!=null){x=E.aoI(new B.a95(t),t.length,C.ak,D.re,!0)
w=D.xk}else{v=this.e
if(v!=null){x=new A.cf(D.eQ,A.kl(A.kq(A.d([D.lI,A.cm(J.cj(v),u)],y.u),C.aE,C.an,C.aU),u,u),u)
w=D.xl}else{x=D.rm
w=D.xm}}return E.Du(new A.fb(x,w),C.dv,new B.a96(),C.hS,C.cw,E.ai8())}}
B.r9.prototype={
K(d){var x,w,v,u,t,s=null,r=this.c,q=r.i(0,"role"),p=q==null?s:J.cj(q)
if(p==null)p="Service"
q=r.i(0,"organization")
x=q==null?s:J.cj(q)
q=r.i(0,"location")
w=q==null?s:J.cj(q)
r=r.i(0,"year")
v=r==null?s:J.cj(r)
r=y.x
q=A.d([],r)
if(x!=null&&x.length!==0)q.push(x)
if(w!=null&&w.length!==0)q.push(w)
r=A.d([],r)
if(q.length!==0)r.push(C.b.b1(q,"  "))
u=C.b.b1(r,"\n")
r=A.cm(p,s)
q=u.length!==0?A.cm(u,A.V(d).ok.z):s
t=v!=null&&v.length!==0?A.cm(v,A.V(d).ok.as):s
return A.jm(s,s,new B.a9c(this),q,r,t)}}
B.Cp.prototype={
an(){this.aL()
this.lC()},
cA(){var x=this.dE$
if(x!=null){x.aB()
x.dN()
this.dE$=null}this.jm()}}
var z=a.updateTypes(["r9(U,n)"])
B.a97.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.a98.prototype={
$0(){this.a.e=this.b},
$S:0}
B.a99.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.a9a.prototype={
$0(){this.a.e=this.b},
$S:0}
B.a95.prototype={
$2(d,e){return new B.r9(this.a[e],null)},
$S:z+0}
B.a96.prototype={
$2(d,e){var x=A.Z(e,y.l)
if(d!=null)x.push(d)
return A.jJ(C.co,x,C.cW)},
$S:165}
B.a9b.prototype={
$1(d){return y.B.a(d).fo(0,y.w,y.b)},
$S:166}
B.a9c.prototype={
$0(){var x=this.a.c.i(0,"link"),w=x==null?null:J.cj(x)
if(w!=null&&w.length!==0)A.Sd(A.eg(w,0,null))},
$S:0};(function aliases(){var x=B.Cp.prototype
x.Xt=x.an})();(function inheritance(){var x=a.mixinHard,w=a.inherit,v=a.inheritMany
w(B.kd,A.a_)
w(B.Cp,A.a6)
w(B.Kh,B.Cp)
v(A.j3,[B.a97,B.a98,B.a99,B.a9a,B.a9c])
v(A.kn,[B.a95,B.a96])
w(B.a9b,A.fw)
w(B.r9,A.av)
x(B.Cp,A.iX)})()
A.C6(b.typeUniverse,JSON.parse('{"r9":{"av":[],"f":[]},"kd":{"a_":[],"f":[]},"Kh":{"a6":["kd"]}}'))
var y={o:A.a3("dP"),x:A.a3("y<p>"),u:A.a3("y<f>"),y:A.a3("aA<p,@>"),B:A.a3("aA<@,@>"),w:A.a3("p"),l:A.a3("f"),b:A.a3("@"),v:A.a3("~")};(function constants(){F.Cv=new A.dz(59078,"MaterialIcons",!1)
F.CG=new A.fB(F.Cv,null,null,null)})()};
(a=>{a["XK4npW7D/5FiOj60KPAs7G/KjEw="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.dart.js_5.part.js.map
