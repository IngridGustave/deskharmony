function defaultSeparation$1(e,n){return e.parent===n.parent?1:2}function meanX(e){return e.reduce(meanXReduce,0)/e.length}function meanXReduce(e,n){return e+n.x}function maxY(e){return 1+e.reduce(maxYReduce,0)}function maxYReduce(e,n){return Math.max(e,n.y)}function leafLeft(e){var n;while(n=e.children)e=n[0];return e}function leafRight(e){var n;while(n=e.children)e=n[n.length-1];return e}function cluster(){var e=defaultSeparation$1,n=1,t=1,r=false;function cluster(i){var a,o=0;i.eachAfter((function(n){var t=n.children;if(t){n.x=meanX(t);n.y=maxY(t)}else{n.x=a?o+=e(n,a):0;n.y=0;a=n}}));var u=leafLeft(i),c=leafRight(i),l=u.x-e(u,c)/2,s=c.x+e(c,u)/2;return i.eachAfter(r?function(e){e.x=(e.x-i.x)*n;e.y=(i.y-e.y)*t}:function(e){e.x=(e.x-l)/(s-l)*n;e.y=(1-(i.y?e.y/i.y:1))*t})}cluster.separation=function(n){return arguments.length?(e=n,cluster):e};cluster.size=function(e){return arguments.length?(r=false,n=+e[0],t=+e[1],cluster):r?null:[n,t]};cluster.nodeSize=function(e){return arguments.length?(r=true,n=+e[0],t=+e[1],cluster):r?[n,t]:null};return cluster}function count(e){var n=0,t=e.children,r=t&&t.length;if(r)while(--r>=0)n+=t[r].value;else n=1;e.value=n}function node_count(){return this.eachAfter(count)}function node_each(e,n){let t=-1;for(const r of this)e.call(n,r,++t,this);return this}function node_eachBefore(e,n){var t,r,i=this,a=[i],o=-1;while(i=a.pop()){e.call(n,i,++o,this);if(t=i.children)for(r=t.length-1;r>=0;--r)a.push(t[r])}return this}function node_eachAfter(e,n){var t,r,i,a=this,o=[a],u=[],c=-1;while(a=o.pop()){u.push(a);if(t=a.children)for(r=0,i=t.length;r<i;++r)o.push(t[r])}while(a=u.pop())e.call(n,a,++c,this);return this}function node_find(e,n){let t=-1;for(const r of this)if(e.call(n,r,++t,this))return r}function node_sum(e){return this.eachAfter((function(n){var t=+e(n.data)||0,r=n.children,i=r&&r.length;while(--i>=0)t+=r[i].value;n.value=t}))}function node_sort(e){return this.eachBefore((function(n){n.children&&n.children.sort(e)}))}function node_path(e){var n=this,t=leastCommonAncestor(n,e),r=[n];while(n!==t){n=n.parent;r.push(n)}var i=r.length;while(e!==t){r.splice(i,0,e);e=e.parent}return r}function leastCommonAncestor(e,n){if(e===n)return e;var t=e.ancestors(),r=n.ancestors(),i=null;e=t.pop();n=r.pop();while(e===n){i=e;e=t.pop();n=r.pop()}return i}function node_ancestors(){var e=this,n=[e];while(e=e.parent)n.push(e);return n}function node_descendants(){return Array.from(this)}function node_leaves(){var e=[];this.eachBefore((function(n){n.children||e.push(n)}));return e}function node_links(){var e=this,n=[];e.each((function(t){t!==e&&n.push({source:t.parent,target:t})}));return n}function*node_iterator(){var e,n,t,r,i=this,a=[i];do{e=a.reverse(),a=[];while(i=e.pop()){yield i;if(n=i.children)for(t=0,r=n.length;t<r;++t)a.push(n[t])}}while(a.length)}function hierarchy(e,n){if(e instanceof Map){e=[void 0,e];void 0===n&&(n=mapChildren)}else void 0===n&&(n=objectChildren);var t,r,i,a,o,u=new Node$1(e),c=[u];while(t=c.pop())if((i=n(t.data))&&(o=(i=Array.from(i)).length)){t.children=i;for(a=o-1;a>=0;--a){c.push(r=i[a]=new Node$1(i[a]));r.parent=t;r.depth=t.depth+1}}return u.eachBefore(computeHeight)}function node_copy(){return hierarchy(this).eachBefore(copyData)}function objectChildren(e){return e.children}function mapChildren(e){return Array.isArray(e)?e[1]:null}function copyData(e){void 0!==e.data.value&&(e.value=e.data.value);e.data=e.data.data}function computeHeight(e){var n=0;do{e.height=n}while((e=e.parent)&&e.height<++n)}function Node$1(e){this.data=e;this.depth=this.height=0;this.parent=null}Node$1.prototype=hierarchy.prototype={constructor:Node$1,count:node_count,each:node_each,eachAfter:node_eachAfter,eachBefore:node_eachBefore,find:node_find,sum:node_sum,sort:node_sort,path:node_path,ancestors:node_ancestors,descendants:node_descendants,leaves:node_leaves,links:node_links,copy:node_copy,[Symbol.iterator]:node_iterator};function optional(e){return null==e?null:required(e)}function required(e){if("function"!==typeof e)throw new Error;return e}function constantZero(){return 0}function constant(e){return function(){return e}}const e=1664525;const n=1013904223;const t=4294967296;function lcg(){let r=1;return()=>(r=(e*r+n)%t)/t}function array(e){return"object"===typeof e&&"length"in e?e:Array.from(e)}function shuffle(e,n){let t,r,i=e.length;while(i){r=n()*i--|0;t=e[i];e[i]=e[r];e[r]=t}return e}function enclose(e){return packEncloseRandom(e,lcg())}function packEncloseRandom(e,n){var t,r,i=0,a=(e=shuffle(Array.from(e),n)).length,o=[];while(i<a){t=e[i];r&&enclosesWeak(r,t)?++i:(r=encloseBasis(o=extendBasis(o,t)),i=0)}return r}function extendBasis(e,n){var t,r;if(enclosesWeakAll(n,e))return[n];for(t=0;t<e.length;++t)if(enclosesNot(n,e[t])&&enclosesWeakAll(encloseBasis2(e[t],n),e))return[e[t],n];for(t=0;t<e.length-1;++t)for(r=t+1;r<e.length;++r)if(enclosesNot(encloseBasis2(e[t],e[r]),n)&&enclosesNot(encloseBasis2(e[t],n),e[r])&&enclosesNot(encloseBasis2(e[r],n),e[t])&&enclosesWeakAll(encloseBasis3(e[t],e[r],n),e))return[e[t],e[r],n];throw new Error}function enclosesNot(e,n){var t=e.r-n.r,r=n.x-e.x,i=n.y-e.y;return t<0||t*t<r*r+i*i}function enclosesWeak(e,n){var t=e.r-n.r+1e-9*Math.max(e.r,n.r,1),r=n.x-e.x,i=n.y-e.y;return t>0&&t*t>r*r+i*i}function enclosesWeakAll(e,n){for(var t=0;t<n.length;++t)if(!enclosesWeak(e,n[t]))return false;return true}function encloseBasis(e){switch(e.length){case 1:return encloseBasis1(e[0]);case 2:return encloseBasis2(e[0],e[1]);case 3:return encloseBasis3(e[0],e[1],e[2])}}function encloseBasis1(e){return{x:e.x,y:e.y,r:e.r}}function encloseBasis2(e,n){var t=e.x,r=e.y,i=e.r,a=n.x,o=n.y,u=n.r,c=a-t,l=o-r,s=u-i,f=Math.sqrt(c*c+l*l);return{x:(t+a+c/f*s)/2,y:(r+o+l/f*s)/2,r:(f+i+u)/2}}function encloseBasis3(e,n,t){var r=e.x,i=e.y,a=e.r,o=n.x,u=n.y,c=n.r,l=t.x,s=t.y,f=t.r,h=r-o,d=r-l,p=i-u,y=i-s,x=c-a,m=f-a,v=r*r+i*i-a*a,g=v-o*o-u*u+c*c,w=v-l*l-s*s+f*f,_=d*p-h*y,B=(p*w-y*g)/(2*_)-r,k=(y*x-p*m)/_,N=(d*g-h*w)/(2*_)-i,A=(h*m-d*x)/_,R=k*k+A*A-1,z=2*(a+B*k+N*A),M=B*B+N*N-a*a,S=-(Math.abs(R)>1e-6?(z+Math.sqrt(z*z-4*R*M))/(2*R):M/z);return{x:r+B+k*S,y:i+N+A*S,r:S}}function place(e,n,t){var r,i,a,o,u=e.x-n.x,c=e.y-n.y,l=u*u+c*c;if(l){i=n.r+t.r,i*=i;o=e.r+t.r,o*=o;if(i>o){r=(l+o-i)/(2*l);a=Math.sqrt(Math.max(0,o/l-r*r));t.x=e.x-r*u-a*c;t.y=e.y-r*c+a*u}else{r=(l+i-o)/(2*l);a=Math.sqrt(Math.max(0,i/l-r*r));t.x=n.x+r*u-a*c;t.y=n.y+r*c+a*u}}else{t.x=n.x+t.r;t.y=n.y}}function intersects(e,n){var t=e.r+n.r-1e-6,r=n.x-e.x,i=n.y-e.y;return t>0&&t*t>r*r+i*i}function score(e){var n=e._,t=e.next._,r=n.r+t.r,i=(n.x*t.r+t.x*n.r)/r,a=(n.y*t.r+t.y*n.r)/r;return i*i+a*a}function Node(e){this._=e;this.next=null;this.previous=null}function packSiblingsRandom(e,n){if(!(a=(e=array(e)).length))return 0;var t,r,i,a,o,u,c,l,s,f,h;t=e[0],t.x=0,t.y=0;if(!(a>1))return t.r;r=e[1],t.x=-r.r,r.x=t.r,r.y=0;if(!(a>2))return t.r+r.r;place(r,t,i=e[2]);t=new Node(t),r=new Node(r),i=new Node(i);t.next=i.previous=r;r.next=t.previous=i;i.next=r.previous=t;e:for(c=3;c<a;++c){place(t._,r._,i=e[c]),i=new Node(i);l=r.next,s=t.previous,f=r._.r,h=t._.r;do{if(f<=h){if(intersects(l._,i._)){r=l,t.next=r,r.previous=t,--c;continue e}f+=l._.r,l=l.next}else{if(intersects(s._,i._)){t=s,t.next=r,r.previous=t,--c;continue e}h+=s._.r,s=s.previous}}while(l!==s.next);i.previous=t,i.next=r,t.next=r.previous=r=i;o=score(t);while((i=i.next)!==r)(u=score(i))<o&&(t=i,o=u);r=t.next}t=[r._],i=r;while((i=i.next)!==r)t.push(i._);i=packEncloseRandom(t,n);for(c=0;c<a;++c)t=e[c],t.x-=i.x,t.y-=i.y;return i.r}function siblings(e){packSiblingsRandom(e,lcg());return e}function defaultRadius(e){return Math.sqrt(e.value)}function index$1(){var e=null,n=1,t=1,r=constantZero;function pack(i){const a=lcg();i.x=n/2,i.y=t/2;e?i.eachBefore(radiusLeaf(e)).eachAfter(packChildrenRandom(r,.5,a)).eachBefore(translateChild(1)):i.eachBefore(radiusLeaf(defaultRadius)).eachAfter(packChildrenRandom(constantZero,1,a)).eachAfter(packChildrenRandom(r,i.r/Math.min(n,t),a)).eachBefore(translateChild(Math.min(n,t)/(2*i.r)));return i}pack.radius=function(n){return arguments.length?(e=optional(n),pack):e};pack.size=function(e){return arguments.length?(n=+e[0],t=+e[1],pack):[n,t]};pack.padding=function(e){return arguments.length?(r="function"===typeof e?e:constant(+e),pack):r};return pack}function radiusLeaf(e){return function(n){n.children||(n.r=Math.max(0,+e(n)||0))}}function packChildrenRandom(e,n,t){return function(r){if(i=r.children){var i,a,o,u=i.length,c=e(r)*n||0;if(c)for(a=0;a<u;++a)i[a].r+=c;o=packSiblingsRandom(i,t);if(c)for(a=0;a<u;++a)i[a].r-=c;r.r=o+c}}}function translateChild(e){return function(n){var t=n.parent;n.r*=e;if(t){n.x=t.x+e*n.x;n.y=t.y+e*n.y}}}function roundNode(e){e.x0=Math.round(e.x0);e.y0=Math.round(e.y0);e.x1=Math.round(e.x1);e.y1=Math.round(e.y1)}function treemapDice(e,n,t,r,i){var a,o=e.children,u=-1,c=o.length,l=e.value&&(r-n)/e.value;while(++u<c){a=o[u],a.y0=t,a.y1=i;a.x0=n,a.x1=n+=a.value*l}}function partition(){var e=1,n=1,t=0,r=false;function partition(i){var a=i.height+1;i.x0=i.y0=t;i.x1=e;i.y1=n/a;i.eachBefore(positionNode(n,a));r&&i.eachBefore(roundNode);return i}function positionNode(e,n){return function(r){r.children&&treemapDice(r,r.x0,e*(r.depth+1)/n,r.x1,e*(r.depth+2)/n);var i=r.x0,a=r.y0,o=r.x1-t,u=r.y1-t;o<i&&(i=o=(i+o)/2);u<a&&(a=u=(a+u)/2);r.x0=i;r.y0=a;r.x1=o;r.y1=u}}partition.round=function(e){return arguments.length?(r=!!e,partition):r};partition.size=function(t){return arguments.length?(e=+t[0],n=+t[1],partition):[e,n]};partition.padding=function(e){return arguments.length?(t=+e,partition):t};return partition}var r={depth:-1},i={},a={};function defaultId(e){return e.id}function defaultParentId(e){return e.parentId}function stratify(){var e,n=defaultId,t=defaultParentId;function stratify(o){var u,c,l,s,f,h,d,p,y=Array.from(o),x=n,m=t,v=new Map;if(null!=e){const n=y.map(((n,t)=>normalize(e(n,t,o))));const t=n.map(parentof);const r=new Set(n).add("");for(const e of t)if(!r.has(e)){r.add(e);n.push(e);t.push(parentof(e));y.push(a)}x=(e,t)=>n[t];m=(e,n)=>t[n]}for(l=0,u=y.length;l<u;++l){c=y[l],h=y[l]=new Node$1(c);if(null!=(d=x(c,l,o))&&(d+="")){p=h.id=d;v.set(p,v.has(p)?i:h)}null!=(d=m(c,l,o))&&(d+="")&&(h.parent=d)}for(l=0;l<u;++l){h=y[l];if(d=h.parent){f=v.get(d);if(!f)throw new Error("missing: "+d);if(f===i)throw new Error("ambiguous: "+d);f.children?f.children.push(h):f.children=[h];h.parent=f}else{if(s)throw new Error("multiple roots");s=h}}if(!s)throw new Error("no root");if(null!=e){while(s.data===a&&1===s.children.length)s=s.children[0],--u;for(let e=y.length-1;e>=0;--e){h=y[e];if(h.data!==a)break;h.data=null}}s.parent=r;s.eachBefore((function(e){e.depth=e.parent.depth+1;--u})).eachBefore(computeHeight);s.parent=null;if(u>0)throw new Error("cycle");return s}stratify.id=function(e){return arguments.length?(n=optional(e),stratify):n};stratify.parentId=function(e){return arguments.length?(t=optional(e),stratify):t};stratify.path=function(n){return arguments.length?(e=optional(n),stratify):e};return stratify}function normalize(e){e=`${e}`;let n=e.length;slash(e,n-1)&&!slash(e,n-2)&&(e=e.slice(0,-1));return"/"===e[0]?e:`/${e}`}function parentof(e){let n=e.length;if(n<2)return"";while(--n>1)if(slash(e,n))break;return e.slice(0,n)}function slash(e,n){if("/"===e[n]){let t=0;while(n>0&&"\\"===e[--n])++t;if(0===(1&t))return true}return false}function defaultSeparation(e,n){return e.parent===n.parent?1:2}function nextLeft(e){var n=e.children;return n?n[0]:e.t}function nextRight(e){var n=e.children;return n?n[n.length-1]:e.t}function moveSubtree(e,n,t){var r=t/(n.i-e.i);n.c-=r;n.s+=t;e.c+=r;n.z+=t;n.m+=t}function executeShifts(e){var n,t=0,r=0,i=e.children,a=i.length;while(--a>=0){n=i[a];n.z+=t;n.m+=t;t+=n.s+(r+=n.c)}}function nextAncestor(e,n,t){return e.a.parent===n.parent?e.a:t}function TreeNode(e,n){this._=e;this.parent=null;this.children=null;this.A=null;this.a=this;this.z=0;this.m=0;this.c=0;this.s=0;this.t=null;this.i=n}TreeNode.prototype=Object.create(Node$1.prototype);function treeRoot(e){var n,t,r,i,a,o=new TreeNode(e,0),u=[o];while(n=u.pop())if(r=n._.children){n.children=new Array(a=r.length);for(i=a-1;i>=0;--i){u.push(t=n.children[i]=new TreeNode(r[i],i));t.parent=n}}(o.parent=new TreeNode(null,0)).children=[o];return o}function tree(){var e=defaultSeparation,n=1,t=1,r=null;function tree(i){var a=treeRoot(i);a.eachAfter(firstWalk),a.parent.m=-a.z;a.eachBefore(secondWalk);if(r)i.eachBefore(sizeNode);else{var o=i,u=i,c=i;i.eachBefore((function(e){e.x<o.x&&(o=e);e.x>u.x&&(u=e);e.depth>c.depth&&(c=e)}));var l=o===u?1:e(o,u)/2,s=l-o.x,f=n/(u.x+l+s),h=t/(c.depth||1);i.eachBefore((function(e){e.x=(e.x+s)*f;e.y=e.depth*h}))}return i}function firstWalk(n){var t=n.children,r=n.parent.children,i=n.i?r[n.i-1]:null;if(t){executeShifts(n);var a=(t[0].z+t[t.length-1].z)/2;if(i){n.z=i.z+e(n._,i._);n.m=n.z-a}else n.z=a}else i&&(n.z=i.z+e(n._,i._));n.parent.A=apportion(n,i,n.parent.A||r[0])}function secondWalk(e){e._.x=e.z+e.parent.m;e.m+=e.parent.m}function apportion(n,t,r){if(t){var i,a=n,o=n,u=t,c=a.parent.children[0],l=a.m,s=o.m,f=u.m,h=c.m;while(u=nextRight(u),a=nextLeft(a),u&&a){c=nextLeft(c);o=nextRight(o);o.a=n;i=u.z+f-a.z-l+e(u._,a._);if(i>0){moveSubtree(nextAncestor(u,n,r),n,i);l+=i;s+=i}f+=u.m;l+=a.m;h+=c.m;s+=o.m}if(u&&!nextRight(o)){o.t=u;o.m+=f-s}if(a&&!nextLeft(c)){c.t=a;c.m+=l-h;r=n}}return r}function sizeNode(e){e.x*=n;e.y=e.depth*t}tree.separation=function(n){return arguments.length?(e=n,tree):e};tree.size=function(e){return arguments.length?(r=false,n=+e[0],t=+e[1],tree):r?null:[n,t]};tree.nodeSize=function(e){return arguments.length?(r=true,n=+e[0],t=+e[1],tree):r?[n,t]:null};return tree}function treemapSlice(e,n,t,r,i){var a,o=e.children,u=-1,c=o.length,l=e.value&&(i-t)/e.value;while(++u<c){a=o[u],a.x0=n,a.x1=r;a.y0=t,a.y1=t+=a.value*l}}var o=(1+Math.sqrt(5))/2;function squarifyRatio(e,n,t,r,i,a){var o,u,c,l,s,f,h,d,p,y,x,m=[],v=n.children,g=0,w=0,_=v.length,B=n.value;while(g<_){c=i-t,l=a-r;do{s=v[w++].value}while(!s&&w<_);f=h=s;y=Math.max(l/c,c/l)/(B*e);x=s*s*y;p=Math.max(h/x,x/f);for(;w<_;++w){s+=u=v[w].value;u<f&&(f=u);u>h&&(h=u);x=s*s*y;d=Math.max(h/x,x/f);if(d>p){s-=u;break}p=d}m.push(o={value:s,dice:c<l,children:v.slice(g,w)});o.dice?treemapDice(o,t,r,i,B?r+=l*s/B:a):treemapSlice(o,t,r,B?t+=c*s/B:i,a);B-=s,g=w}return m}var u=function custom(e){function squarify(n,t,r,i,a){squarifyRatio(e,n,t,r,i,a)}squarify.ratio=function(e){return custom((e=+e)>1?e:1)};return squarify}(o);function index(){var e=u,n=false,t=1,r=1,i=[0],a=constantZero,o=constantZero,c=constantZero,l=constantZero,s=constantZero;function treemap(e){e.x0=e.y0=0;e.x1=t;e.y1=r;e.eachBefore(positionNode);i=[0];n&&e.eachBefore(roundNode);return e}function positionNode(n){var t=i[n.depth],r=n.x0+t,u=n.y0+t,f=n.x1-t,h=n.y1-t;f<r&&(r=f=(r+f)/2);h<u&&(u=h=(u+h)/2);n.x0=r;n.y0=u;n.x1=f;n.y1=h;if(n.children){t=i[n.depth+1]=a(n)/2;r+=s(n)-t;u+=o(n)-t;f-=c(n)-t;h-=l(n)-t;f<r&&(r=f=(r+f)/2);h<u&&(u=h=(u+h)/2);e(n,r,u,f,h)}}treemap.round=function(e){return arguments.length?(n=!!e,treemap):n};treemap.size=function(e){return arguments.length?(t=+e[0],r=+e[1],treemap):[t,r]};treemap.tile=function(n){return arguments.length?(e=required(n),treemap):e};treemap.padding=function(e){return arguments.length?treemap.paddingInner(e).paddingOuter(e):treemap.paddingInner()};treemap.paddingInner=function(e){return arguments.length?(a="function"===typeof e?e:constant(+e),treemap):a};treemap.paddingOuter=function(e){return arguments.length?treemap.paddingTop(e).paddingRight(e).paddingBottom(e).paddingLeft(e):treemap.paddingTop()};treemap.paddingTop=function(e){return arguments.length?(o="function"===typeof e?e:constant(+e),treemap):o};treemap.paddingRight=function(e){return arguments.length?(c="function"===typeof e?e:constant(+e),treemap):c};treemap.paddingBottom=function(e){return arguments.length?(l="function"===typeof e?e:constant(+e),treemap):l};treemap.paddingLeft=function(e){return arguments.length?(s="function"===typeof e?e:constant(+e),treemap):s};return treemap}function binary(e,n,t,r,i){var a,o,u=e.children,c=u.length,l=new Array(c+1);for(l[0]=o=a=0;a<c;++a)l[a+1]=o+=u[a].value;partition(0,c,e.value,n,t,r,i);function partition(e,n,t,r,i,a,o){if(e>=n-1){var c=u[e];c.x0=r,c.y0=i;c.x1=a,c.y1=o}else{var s=l[e],f=t/2+s,h=e+1,d=n-1;while(h<d){var p=h+d>>>1;l[p]<f?h=p+1:d=p}f-l[h-1]<l[h]-f&&e+1<h&&--h;var y=l[h]-s,x=t-y;if(a-r>o-i){var m=t?(r*x+a*y)/t:a;partition(e,h,y,r,i,m,o);partition(h,n,x,m,i,a,o)}else{var v=t?(i*x+o*y)/t:o;partition(e,h,y,r,i,a,v);partition(h,n,x,r,v,a,o)}}}}function sliceDice(e,n,t,r,i){(1&e.depth?treemapSlice:treemapDice)(e,n,t,r,i)}var c=function custom(e){function resquarify(n,t,r,i,a){if((o=n._squarify)&&o.ratio===e){var o,u,c,l,s,f=-1,h=o.length,d=n.value;while(++f<h){u=o[f],c=u.children;for(l=u.value=0,s=c.length;l<s;++l)u.value+=c[l].value;u.dice?treemapDice(u,t,r,i,d?r+=(a-r)*u.value/d:a):treemapSlice(u,t,r,d?t+=(i-t)*u.value/d:i,a);d-=u.value}}else{n._squarify=o=squarifyRatio(e,n,t,r,i,a);o.ratio=e}}resquarify.ratio=function(e){return custom((e=+e)>1?e:1)};return resquarify}(o);export{Node$1 as Node,cluster,hierarchy,index$1 as pack,enclose as packEnclose,siblings as packSiblings,partition,stratify,tree,index as treemap,binary as treemapBinary,treemapDice,c as treemapResquarify,treemapSlice,sliceDice as treemapSliceDice,u as treemapSquarify};

