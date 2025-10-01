((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,E,D,G,B={
bmj(){return new B.Md(null)},
bgD(d){var x=J.O1(d,new B.azu(),y.y)
x=A.a1(x,x.$ti.h("ap.E"))
x.$flags=1
return x},
bso(d,e){var x
if(d===e)return!0
if(e==null||d.length!==e.length)return!1
for(x=0;x<d.length;++x)if(!A.QB(d[x],e[x]))return!1
return!0},
Md:function Md(d){this.a=d},
a9A:function a9A(d){var _=this
_.e=_.d=null
_.f=$
_.dm$=d
_.c=_.a=null},
azq:function azq(d,e){this.a=d
this.b=e},
azr:function azr(d,e){this.a=d
this.b=e},
azs:function azs(d,e){this.a=d
this.b=e},
azt:function azt(d,e){this.a=d
this.b=e},
azo:function azo(d){this.a=d},
azp:function azp(){},
azu:function azu(){},
SZ:function SZ(d,e){this.c=d
this.a=e},
azv:function azv(d){this.a=d},
a2_:function a2_(){}},F,H
J=c[1]
A=c[0]
C=c[2]
E=c[8]
D=c[12]
G=c[10]
B=a.updateHolder(c[5],B)
F=c[11]
H=c[7]
B.Md.prototype={
ai(){return new B.a9A(null)}}
B.a9A.prototype={
an(){this.VA()
this.py()},
py(){var x=0,w=A.S(y.v),v=1,u=[],t=this,s,r,q,p,o,n,m,l,k,j
var $async$py=A.O(function(d,e){if(d===1){u.push(e)
x=v}while(true)switch(x){case 0:v=3
x=6
return A.V(E.ahp("academic_service_list.json"),$async$py)
case 6:s=e
r=B.bgD(s)
if(t.c!=null)t.aq(new B.azq(t,r))
v=1
x=5
break
case 3:v=2
k=u.pop()
q=A.ac(k)
if(t.c!=null)t.aq(new B.azr(t,q))
x=5
break
case 2:x=1
break
case 5:v=8
l=t.f
x=11
return A.V((l===$?t.f=$.aJ4():l).w0("academic_service_list.json"),$async$py)
case 11:p=e
o=B.bgD(p)
if(t.c!=null&&!B.bso(o,t.d))t.aq(new B.azs(t,o))
v=1
x=10
break
case 8:v=7
j=u.pop()
n=A.ac(j)
if(t.c!=null&&t.d==null)t.aq(new B.azt(t,n))
x=10
break
case 7:x=1
break
case 10:return A.Q(null,w)
case 1:return A.P(u.at(-1),w)}})
return A.R($async$py,w)},
gkZ(){return!0},
L(d){var x,w,v=null
this.oR(d)
x=A.Z(d).ok.w
x.toString
x=A.MJ(v,F.Ck,v,v,A.du("Academic Service",x),v)
w=A.Z(d).a6.y
w=w==null?v:w.W(d.ab(y.o).w).a
return A.UP(A.Ol(A.h([x,G.akr(w==null?16:w),E.aN0(C.ct,new A.I0(this.X3(d),v),C.eI,C.bo)],y.u),C.c4,C.aJ),v)},
X3(d){var x,w,v,u=null,t=this.d
if(t!=null){x=t.length
w=new A.X_(new H.Z1(new B.azo(t),x,!0,!0,!0,u),C.aN,C.b4,!1,u,u,D.rc,u,!0,u,0,u,x,C.ck,C.aM,u,u,C.ad,C.ap,u)
v=D.xf}else{x=this.e
if(x!=null){w=new A.cz(D.eM,A.QX(A.Ol(A.h([D.lD,A.du(J.ck(x),u)],y.u),C.b5,C.aJ),u,u),u)
v=D.xg}else{w=D.rj
v=D.xh}}return E.aN1(new A.IQ(w,v),C.eL,new B.azp(),C.lb,C.cy)}}
B.SZ.prototype={
L(d){var x,w,v,u,t,s=null,r=this.c,q=r.i(0,"role"),p=q==null?s:J.ck(q)
if(p==null)p="Service"
q=r.i(0,"organization")
x=q==null?s:J.ck(q)
q=r.i(0,"location")
w=q==null?s:J.ck(q)
r=r.i(0,"year")
v=r==null?s:J.ck(r)
r=y.x
q=A.h([],r)
if(x!=null&&x.length!==0)q.push(x)
if(w!=null&&w.length!==0)q.push(w)
r=A.h([],r)
if(q.length!==0)r.push(C.e.b3(q,"  "))
u=C.e.b3(r,"\n")
r=A.du(p,s)
q=u.length!==0?A.du(u,A.Z(d).ok.z):s
t=v!=null&&v.length!==0?A.du(v,A.Z(d).ok.as):s
return A.MJ(s,s,new B.azv(this),q,r,t)}}
B.a2_.prototype={
an(){this.aN()
this.lc()},
ck(){var x=this.dm$
if(x!=null){x.aw()
x.dj()
this.dm$=null}this.jX()}}
var z=a.updateTypes(["SZ(a_,p)"])
B.azq.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:1}
B.azr.prototype={
$0(){this.a.e=this.b},
$S:1}
B.azs.prototype={
$0(){var x=this.a
x.d=this.b
x.e=null},
$S:1}
B.azt.prototype={
$0(){this.a.e=this.b},
$S:1}
B.azo.prototype={
$2(d,e){return new B.SZ(this.a[e],null)},
$S:z+0}
B.azp.prototype={
$2(d,e){var x=A.a1(e,y.l)
if(d!=null)x.push(d)
return A.LJ(C.ct,x,C.cX)},
$S:139}
B.azu.prototype={
$1(d){return y.B.a(d).f4(0,y.w,y.b)},
$S:168}
B.azv.prototype={
$0(){var x=this.a.c.i(0,"link"),w=x==null?null:J.ck(x)
if(w!=null&&w.length!==0)E.aIC(A.eB(w,0,null))},
$S:1};(function aliases(){var x=B.a2_.prototype
x.VA=x.an})();(function inheritance(){var x=a.mixinHard,w=a.inherit,v=a.inheritMany
w(B.Md,A.a3)
w(B.a2_,A.ab)
w(B.a9A,B.a2_)
v(A.L6,[B.azq,B.azr,B.azs,B.azt,B.azv])
v(A.L7,[B.azo,B.azp])
w(B.azu,A.Ig)
w(B.SZ,A.aw)
x(B.a2_,A.L2)})()
A.Qt(b.typeUniverse,JSON.parse('{"SZ":{"aw":[],"k":[]},"Md":{"a3":[],"k":[]},"a9A":{"ab":["Md"]}}'))
var y={o:A.a5("dO"),x:A.a5("B<t>"),u:A.a5("B<k>"),y:A.a5("av<t,@>"),B:A.a5("av<@,@>"),w:A.a5("t"),l:A.a5("k"),b:A.a5("@"),v:A.a5("~")};(function constants(){F.Ca=new A.en(59078,"MaterialIcons",!1)
F.Ck=new A.Js(F.Ca,null,null)})()};
(a=>{a["0EbAO7TwII3Rqu3RmYuTK+P/glU="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.dart.js_6.part.js.map
