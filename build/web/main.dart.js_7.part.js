((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,E,D,G,B={
az1(){return new B.kP(null)},
at2(d){var x=J.kO(d,new B.abw(),y.y)
x=A.a2(x,x.$ti.h("ar.E"))
x.$flags=1
return x},
aF7(d,e){var x
if(d===e)return!0
if(e==null||d.length!==e.length)return!1
for(x=0;x<d.length;++x)if(!A.mz(d[x],e[x]))return!1
return!0},
kP:function kP(d){this.a=d},
Lr:function Lr(d){var _=this
_.e=_.d=null
_.f=$
_.r=!1
_.dH$=d
_.c=_.a=null},
abu:function abu(d,e){this.a=d
this.b=e},
abv:function abv(d,e){this.a=d
this.b=e},
abz:function abz(d){this.a=d},
abx:function abx(d,e){this.a=d
this.b=e},
aby:function aby(d,e){this.a=d
this.b=e},
abs:function abs(d){this.a=d},
abt:function abt(){},
abw:function abw(){},
rE:function rE(d,e){this.c=d
this.a=e},
abA:function abA(d){this.a=d},
CX:function CX(){}},F
J=c[1]
A=c[0]
C=c[2]
E=c[7]
D=c[12]
G=c[10]
B=a.updateHolder(c[5],B)
F=c[11]
B.kP.prototype={
aj(){return new B.Lr(null)}}
B.Lr.prototype={
ao(){this.WJ()
this.pT()},
pT(){var x=0,w=A.Q(y.v),v=1,u=[],t=this,s,r,q,p,o,n
var $async$pT=A.R(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:o=!1
v=3
x=6
return A.T(E.U9("academic_service_list.json"),$async$pT)
case 6:s=e
r=B.at2(s)
if(t.c!=null)t.am(new B.abu(t,r))
o=!0
v=1
x=5
break
case 3:v=2
n=u.pop()
q=A.af(n)
if(t.c!=null)t.am(new B.abv(t,q))
x=5
break
case 2:x=1
break
case 5:x=o?7:9
break
case 7:t.a5m()
x=8
break
case 9:x=10
return A.T(t.q4(),$async$pT)
case 10:case 8:return A.O(null,w)
case 1:return A.N(u.at(-1),w)}})
return A.P($async$pT,w)},
a5m(){if(this.r)return
this.r=!0
$.br.k4$.push(new B.abz(this))},
q4(){var x=0,w=A.Q(y.v),v=1,u=[],t=this,s,r,q,p,o,n
var $async$q4=A.R(function(d,e){if(d===1){u.push(e)
x=v}for(;;)switch(x){case 0:v=3
p=t.f
x=6
return A.T((p===$?t.f=$.alG():p).wq("academic_service_list.json"),$async$q4)
case 6:s=e
r=B.at2(s)
if(t.c!=null&&!B.aF7(r,t.d))t.am(new B.abx(t,r))
v=1
x=5
break
case 3:v=2
n=u.pop()
q=A.af(n)
if(t.c!=null&&t.d==null)t.am(new B.aby(t,q))
x=5
break
case 2:x=1
break
case 5:return A.O(null,w)
case 1:return A.N(u.at(-1),w)}})
return A.P($async$q4,w)},
gle(){return!0},
L(d){var x,w,v=null
this.pe(d)
x=A.Y(d).ok.w
x.toString
x=A.k1(v,F.CI,v,v,A.cU("Academic Service",x),v)
w=A.Y(d).a8.y
w=w==null?v:w.W(d.ab(y.o).w).a
return A.uD(A.jI(A.c([x,G.Xd(w==null?16:w),E.apA(C.ck,new A.fM(this.Yf(d),v),C.dm,C.b0)],y.u),C.by,C.al,C.aT),v)},
Yf(d){var x,w,v,u=null,t=this.d
if(t!=null){x=E.are(new B.abs(t),t.length,C.ak,D.rc,!0)
w=D.xj}else{v=this.e
if(v!=null){x=new A.c6(D.eM,A.kZ(A.jI(A.c([D.lE,A.cU(J.cu(v),u)],y.u),C.aQ,C.al,C.aT),u,u),u)
w=D.xk}else{x=D.rl
w=D.xl}}return E.E3(new A.h5(x,w),C.eK,new B.abt(),C.hH,C.bT,E.akG())}}
B.rE.prototype={
L(d){var x,w,v,u,t=null,s=this.c,r=J.b1(s),q=r.i(s,"role"),p=q==null?t:J.cu(q)
if(p==null)p="Service"
q=r.i(s,"organization")
x=q==null?t:J.cu(q)
q=r.i(s,"location")
w=q==null?t:J.cu(q)
s=r.i(s,"year")
v=s==null?t:J.cu(s)
s=y.x
r=A.c([],s)
if(x!=null&&x.length!==0)r.push(x)
if(w!=null&&w.length!==0)r.push(w)
s=A.c([],s)
if(r.length!==0)s.push(C.b.b8(r,"  "))
u=C.b.b8(s,"\n")
s=A.cU(p,t)
r=u.length!==0?A.cU(u,A.Y(d).ok.z):t
q=v!=null&&v.length!==0?A.cU(v,A.Y(d).ok.as):t
return A.k1(t,t,new B.abA(this),r,s,q)}}
B.CX.prototype={
ao(){this.aK()
this.lr()},
cF(){var x=this.dH$
if(x!=null){x.aC()
x.dC()
this.dH$=null}this.kb()}}
var z=a.updateTypes(["rE(W,o)"])
B.abu.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.abv.prototype={
$0(){this.a.e=this.b},
$S:0}
B.abz.prototype={
$1(d){var x=this.a
if(x.c==null)return
x.q4()},
$S:5}
B.abx.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:0}
B.aby.prototype={
$0(){this.a.e=this.b},
$S:0}
B.abs.prototype={
$2(d,e){return new B.rE(this.a[e],null)},
$S:z+0}
B.abt.prototype={
$2(d,e){var x=A.a2(e,y.l)
if(d!=null)x.push(d)
return A.j9(C.ck,x,C.cP)},
$S:168}
B.abw.prototype={
$1(d){return J.u5(y.B.a(d),y.w,y.b)},
$S:169}
B.abA.prototype={
$0(){var x=J.bq(this.a.c,"link"),w=x==null?null:J.cu(x)
if(w!=null&&w.length!==0)A.U8(A.et(w,0,null))},
$S:0};(function aliases(){var x=B.CX.prototype
x.WJ=x.ao})();(function inheritance(){var x=a.mixinHard,w=a.inherit,v=a.inheritMany
w(B.kP,A.a3)
w(B.CX,A.ac)
w(B.Lr,B.CX)
v(A.jG,[B.abu,B.abv,B.abx,B.aby,B.abA])
v(A.fx,[B.abz,B.abw])
v(A.jH,[B.abs,B.abt])
w(B.rE,A.ay)
x(B.CX,A.jB)})()
A.p7(b.typeUniverse,JSON.parse('{"rE":{"ay":[],"i":[]},"kP":{"a3":[],"i":[]},"Lr":{"ac":["kP"]}}'))
var y={o:A.a7("e0"),x:A.a7("x<l>"),u:A.a7("x<i>"),y:A.a7("as<l,@>"),B:A.a7("as<@,@>"),w:A.a7("l"),l:A.a7("i"),b:A.a7("@"),v:A.a7("~")};(function constants(){F.Cx=new A.ef(59078,"MaterialIcons",!1)
F.CI=new A.h2(F.Cx,null,null,null)})()};
(a=>{a["f3GR0810Pz4SVyjDuZlMhseE1tI="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.dart.js_7.part.js.map
