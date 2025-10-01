((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,F,D,G,B={
axd(){return new B.kg(null)},
arz(d){var x=J.m6(d,new B.a9n(),y.y)
x=A.Y(x,x.$ti.h("am.E"))
x.$flags=1
return x},
aDi(d,e){var x
if(d===e)return!0
if(e==null||d.length!==e.length)return!1
for(x=0;x<d.length;++x)if(!A.oM(d[x],e[x]))return!1
return!0},
kg:function kg(d){this.a=d},
K2:function K2(d){var _=this
_.e=_.d=null
_.f=$
_.dA$=d
_.c=_.a=null},
a9j:function a9j(d,e){this.a=d
this.b=e},
a9k:function a9k(d,e){this.a=d
this.b=e},
a9l:function a9l(d,e){this.a=d
this.b=e},
a9m:function a9m(d,e){this.a=d
this.b=e},
a9h:function a9h(d){this.a=d},
a9i:function a9i(){},
a9n:function a9n(){},
rh:function rh(d,e){this.c=d
this.a=e},
a9o:function a9o(d){this.a=d},
Co:function Co(){}},E
J=c[1]
A=c[0]
C=c[2]
F=c[7]
D=c[11]
G=c[9]
B=a.updateHolder(c[5],B)
E=c[10]
B.kg.prototype={
ae(){return new B.K2(null)}}
B.K2.prototype={
an(){this.Wr()
this.pO()},
pO(){var x=0,w=A.Q(y.v),v=1,u=[],t=this,s,r,q,p,o,n,m,l,k,j
var $async$pO=A.L(function(d,e){if(d===1){u.push(e)
x=v}while(true)switch(x){case 0:v=3
x=6
return A.U(F.Sg("academic_service_list.json"),$async$pO)
case 6:s=e
r=B.arz(s)
if(t.c!=null)t.al(new B.a9j(t,r))
v=1
x=5
break
case 3:v=2
k=u.pop()
q=A.ad(k)
if(t.c!=null)t.al(new B.a9k(t,q))
x=5
break
case 2:x=1
break
case 5:v=8
l=t.f
x=11
return A.U((l===$?t.f=$.ak1():l).wl("academic_service_list.json"),$async$pO)
case 11:p=e
o=B.arz(p)
if(t.c!=null&&!B.aDi(o,t.d))t.al(new B.a9l(t,o))
v=1
x=10
break
case 8:v=7
j=u.pop()
n=A.ad(j)
if(t.c!=null&&t.d==null)t.al(new B.a9m(t,n))
x=10
break
case 7:x=1
break
case 10:return A.O(null,w)
case 1:return A.N(u.at(-1),w)}})
return A.P($async$pO,w)},
glf(){return!0},
J(d){var x,w,v=null
this.p7(d)
x=A.S(d).ok.w
x.toString
x=A.js(v,E.CO,v,!1,v,A.bP("Academic Service",x,v),v)
w=A.S(d).a3.y
w=w==null?v:w.T(d.a7(y.o).w).a
return A.p7(A.fd(A.c([x,G.Vf(w==null?16:w),F.anW(C.cj,new A.eW(this.XW(d),v),C.dg,C.aY)],y.u),C.bA,C.a6,C.ag),v,v,v,v,v)},
XW(d){var x,w,v,u=null,t=this.d
if(t!=null){x=A.alm(new B.a9h(t),t.length,C.aq,D.ra,!0)
w=D.xi}else{v=this.e
if(v!=null){x=new A.bw(D.eH,A.hi(A.fd(A.c([D.lC,A.bP(J.ce(v),u,u)],y.u),C.aj,C.a6,C.ag),u,u),u)
w=D.xj}else{x=D.ri
w=D.xk}}return A.tK(new A.fn(x,w),C.eF,new B.a9i(),C.l8,C.bU,A.aj0())}}
B.rh.prototype={
J(d){var x,w,v,u,t,s=null,r=this.c,q=r.i(0,"role"),p=q==null?s:J.ce(q)
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
if(q.length!==0)r.push(C.b.b8(q,"  "))
u=C.b.b8(r,"\n")
r=A.bP(p,s,s)
q=u.length!==0?A.bP(u,A.S(d).ok.z,s):s
t=v!=null&&v.length!==0?A.bP(v,A.S(d).ok.as,s):s
return A.js(s,s,new B.a9o(this),!1,q,r,t)}}
B.Co.prototype={
an(){this.aL()
this.lu()},
cr(){var x=this.dA$
if(x!=null){x.aC()
x.dt()
this.dA$=null}this.kb()}}
var z=a.updateTypes(["rh(M,l)"])
B.a9j.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.a9k.prototype={
$0(){this.a.e=this.b},
$S:0}
B.a9l.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.a9m.prototype={
$0(){this.a.e=this.b},
$S:0}
B.a9h.prototype={
$2(d,e){return new B.rh(this.a[e],null)},
$S:z+0}
B.a9i.prototype={
$2(d,e){var x=A.Y(e,y.l)
if(d!=null)x.push(d)
return A.iM(C.cj,x,C.c8)},
$S:174}
B.a9n.prototype={
$1(d){return y.B.a(d).fg(0,y.w,y.b)},
$S:175}
B.a9o.prototype={
$0(){var x=this.a.c.i(0,"link"),w=x==null?null:J.ce(x)
if(w!=null&&w.length!==0)F.ajA(A.eF(w,0,null))},
$S:0};(function aliases(){var x=B.Co.prototype
x.Wr=x.an})();(function inheritance(){var x=a.mixinHard,w=a.inherit,v=a.inheritMany
w(B.kg,A.X)
w(B.Co,A.a2)
w(B.K2,B.Co)
v(A.ja,[B.a9j,B.a9k,B.a9l,B.a9m,B.a9o])
v(A.i8,[B.a9h,B.a9i])
w(B.a9n,A.fc)
w(B.rh,A.an)
x(B.Co,A.j6)})()
A.tf(b.typeUniverse,JSON.parse('{"rh":{"an":[],"f":[]},"kg":{"X":[],"f":[]},"K2":{"a2":["kg"]}}'))
var y={o:A.a1("dP"),x:A.a1("y<o>"),u:A.a1("y<f>"),y:A.a1("ax<o,@>"),B:A.a1("ax<@,@>"),w:A.a1("o"),l:A.a1("f"),b:A.a1("@"),v:A.a1("~")};(function constants(){E.CB=new A.dT(59078,"MaterialIcons",!1)
E.CO=new A.fl(E.CB,null,null,null)})()};
(a=>{a["vOes8SRSVGL6w5Ylv+Rt1f20vQE="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.dart.js_6.part.js.map
