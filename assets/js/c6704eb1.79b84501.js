"use strict";(self.webpackChunkdocumentation=self.webpackChunkdocumentation||[]).push([[6287],{7385:(n,e,i)=>{i.r(e),i.d(e,{assets:()=>l,contentTitle:()=>r,default:()=>h,frontMatter:()=>d,metadata:()=>c,toc:()=>a});var t=i(4848),s=i(8453);const d={sidebar_position:3,tags:["\u041d\u0430\u0447\u0430\u043b\u043e"]},r="\u0417\u0430\u043f\u0443\u0441\u043a \u0438 \u043e\u0442\u043b\u0430\u0434\u043a\u0430 \u0442\u0435\u0441\u0442\u043e\u0432",c={id:"getting-started/run/run",title:"\u0417\u0430\u043f\u0443\u0441\u043a \u0438 \u043e\u0442\u043b\u0430\u0434\u043a\u0430 \u0442\u0435\u0441\u0442\u043e\u0432",description:"\u0412 \u043e\u0431\u0449\u0435\u043c \u0441\u043b\u0443\u0447\u0430\u0435 \u0437\u0430\u043f\u0443\u0441\u043a \u0442\u0435\u0441\u0442\u043e\u0432 \u0432\u044b\u043f\u043e\u043b\u043d\u044f\u0435\u0442\u0441\u044f \u0437\u0430\u043f\u0443\u0441\u043a\u043e\u043c 1\u0421:\u041f\u0440\u0435\u0434\u043f\u0440\u0438\u044f\u0442\u0438\u044f \u0441 \u043f\u0430\u0440\u0430\u043c\u0435\u0442\u0440\u043e\u043c RunUnitTests. \u041f\u0440\u0438 \u043d\u0435\u043e\u0431\u0445\u043e\u0434\u0438\u043c\u043e\u0441\u0442\u0438 \u043c\u043e\u0436\u043d\u043e \u0443\u043a\u0430\u0437\u0430\u0442\u044c \u043f\u0443\u0442\u044c \u043a \u0444\u0430\u0439\u043b\u0443 \u043a\u043e\u043d\u0444\u0438\u0433\u0443\u0440\u0430\u0446\u0438\u0438 \u0437\u0430\u043f\u0443\u0441\u043a\u0430 \u0434\u043b\u044f \u043d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0438 \u043f\u0440\u043e\u0433\u043e\u043d\u0430 \u0442\u0435\u0441\u0442\u043e\u0432.",source:"@site/docs/getting-started/run/run.md",sourceDirName:"getting-started/run",slug:"/getting-started/run/",permalink:"/yaxunit/docs/getting-started/run/",draft:!1,unlisted:!1,editUrl:"https://github.com/bia-technologies/yaxunit/docs/getting-started/run/run.md",tags:[{inline:!0,label:"\u041d\u0430\u0447\u0430\u043b\u043e",permalink:"/yaxunit/docs/tags/\u043d\u0430\u0447\u0430\u043b\u043e"}],version:"current",sidebarPosition:3,frontMatter:{sidebar_position:3,tags:["\u041d\u0430\u0447\u0430\u043b\u043e"]},sidebar:"tutorialSidebar",previous:{title:"\u041f\u0438\u0448\u0435\u043c \u043f\u0435\u0440\u0432\u044b\u0439 \u0442\u0435\u0441\u0442",permalink:"/yaxunit/docs/getting-started/first-test"},next:{title:"\u041a\u043e\u043d\u0444\u0438\u0433\u0443\u0440\u0430\u0446\u0438\u044f \u0437\u0430\u043f\u0443\u0441\u043a\u0430",permalink:"/yaxunit/docs/getting-started/run/configuration"}},l={},a=[{value:"\u0417\u0430\u043f\u0443\u0441\u043a \u0438\u0437 1\u0421 Development Tools (EDT)",id:"\u0437\u0430\u043f\u0443\u0441\u043a-\u0438\u0437-1\u0441-development-tools-edt",level:2},{value:"\u041a\u043e\u043d\u0444\u0438\u0433\u0443\u0440\u0430\u0446\u0438\u044f \u0437\u0430\u043f\u0443\u0441\u043a\u0430",id:"\u043a\u043e\u043d\u0444\u0438\u0433\u0443\u0440\u0430\u0446\u0438\u044f-\u0437\u0430\u043f\u0443\u0441\u043a\u0430",level:3},{value:"\u0417\u0430\u043f\u0443\u0441\u043a \u0438\u0437 \u0431\u043e\u043a\u043e\u0432\u043e\u0439 \u043f\u0430\u043d\u0435\u043b\u0438 \u043c\u043e\u0434\u0443\u043b\u044f",id:"\u0437\u0430\u043f\u0443\u0441\u043a-\u0438\u0437-\u0431\u043e\u043a\u043e\u0432\u043e\u0439-\u043f\u0430\u043d\u0435\u043b\u0438-\u043c\u043e\u0434\u0443\u043b\u044f",level:3},{value:"\u0417\u0430\u043f\u0443\u0441\u043a \u0438\u0437 \u043f\u0430\u043b\u0438\u0442\u0440\u044b \u043a\u043e\u043c\u0430\u043d\u0434",id:"\u0437\u0430\u043f\u0443\u0441\u043a-\u0438\u0437-\u043f\u0430\u043b\u0438\u0442\u0440\u044b-\u043a\u043e\u043c\u0430\u043d\u0434",level:3},{value:"\u0417\u0430\u043f\u0443\u0441\u043a \u0438\u0437 \u043a\u043e\u043d\u0444\u0438\u0433\u0443\u0440\u0430\u0442\u043e\u0440\u0430",id:"\u0437\u0430\u043f\u0443\u0441\u043a-\u0438\u0437-\u043a\u043e\u043d\u0444\u0438\u0433\u0443\u0440\u0430\u0442\u043e\u0440\u0430",level:2},{value:"\u0417\u0430\u043f\u0443\u0441\u043a \u0438\u0437 \u043f\u0440\u0435\u0434\u043f\u0440\u0438\u044f\u0442\u0438\u044f",id:"\u0437\u0430\u043f\u0443\u0441\u043a-\u0438\u0437-\u043f\u0440\u0435\u0434\u043f\u0440\u0438\u044f\u0442\u0438\u044f",level:2},{value:"\u0421\u0442\u0440\u043e\u043a\u0430 \u0437\u0430\u043f\u0443\u0441\u043a\u0430 \u043f\u0440\u0435\u0434\u043f\u0440\u0438\u044f\u0442\u0438\u044f",id:"\u0441\u0442\u0440\u043e\u043a\u0430-\u0437\u0430\u043f\u0443\u0441\u043a\u0430-\u043f\u0440\u0435\u0434\u043f\u0440\u0438\u044f\u0442\u0438\u044f",level:2}];function o(n){const e={a:"a",admonition:"admonition",br:"br",code:"code",em:"em",h1:"h1",h2:"h2",h3:"h3",header:"header",img:"img",li:"li",ol:"ol",p:"p",ul:"ul",...(0,s.R)(),...n.components};return(0,t.jsxs)(t.Fragment,{children:[(0,t.jsx)(e.header,{children:(0,t.jsx)(e.h1,{id:"\u0437\u0430\u043f\u0443\u0441\u043a-\u0438-\u043e\u0442\u043b\u0430\u0434\u043a\u0430-\u0442\u0435\u0441\u0442\u043e\u0432",children:"\u0417\u0430\u043f\u0443\u0441\u043a \u0438 \u043e\u0442\u043b\u0430\u0434\u043a\u0430 \u0442\u0435\u0441\u0442\u043e\u0432"})}),"\n",(0,t.jsxs)(e.p,{children:["\u0412 \u043e\u0431\u0449\u0435\u043c \u0441\u043b\u0443\u0447\u0430\u0435 \u0437\u0430\u043f\u0443\u0441\u043a \u0442\u0435\u0441\u0442\u043e\u0432 \u0432\u044b\u043f\u043e\u043b\u043d\u044f\u0435\u0442\u0441\u044f \u0437\u0430\u043f\u0443\u0441\u043a\u043e\u043c 1\u0421:\u041f\u0440\u0435\u0434\u043f\u0440\u0438\u044f\u0442\u0438\u044f \u0441 \u043f\u0430\u0440\u0430\u043c\u0435\u0442\u0440\u043e\u043c ",(0,t.jsx)(e.code,{children:"RunUnitTests"}),". \u041f\u0440\u0438 \u043d\u0435\u043e\u0431\u0445\u043e\u0434\u0438\u043c\u043e\u0441\u0442\u0438 \u043c\u043e\u0436\u043d\u043e \u0443\u043a\u0430\u0437\u0430\u0442\u044c \u043f\u0443\u0442\u044c \u043a \u0444\u0430\u0439\u043b\u0443 ",(0,t.jsx)(e.a,{href:"/yaxunit/docs/getting-started/run/configuration",children:"\u043a\u043e\u043d\u0444\u0438\u0433\u0443\u0440\u0430\u0446\u0438\u0438 \u0437\u0430\u043f\u0443\u0441\u043a\u0430"})," \u0434\u043b\u044f \u043d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0438 \u043f\u0440\u043e\u0433\u043e\u043d\u0430 \u0442\u0435\u0441\u0442\u043e\u0432."]}),"\n",(0,t.jsx)(e.p,{children:"\u0414\u043b\u044f \u0443\u043f\u0440\u043e\u0449\u0435\u043d\u0438\u044f \u044d\u0442\u043e\u0433\u043e \u043f\u0440\u043e\u0446\u0435\u0441\u0441\u0430 \u0435\u0441\u0442\u044c \u0434\u0440\u0443\u0433\u0438\u0435 \u0441\u043f\u043e\u0441\u043e\u0431\u044b."}),"\n",(0,t.jsx)(e.admonition,{title:"\u0412\u0430\u0436\u043d\u043e",type:"caution",children:(0,t.jsx)(e.p,{children:(0,t.jsxs)(e.em,{children:["\u041f\u043e\u0441\u043b\u0435 \u0437\u0430\u0433\u0440\u0443\u0437\u043a\u0438 \u0440\u0430\u0441\u0448\u0438\u0440\u0435\u043d\u0438\u044f \u0432 \u0438\u043d\u0444\u043e\u0440\u043c\u0430\u0446\u0438\u043e\u043d\u043d\u0443\u044e \u0431\u0430\u0437\u0443 \u043d\u0435\u043e\u0431\u0445\u043e\u0434\u0438\u043c\u043e \u043e\u0442\u043a\u043b\u044e\u0447\u0438\u0442\u044c \u0443 \u043d\u0435\u0433\u043e ",(0,t.jsx)(e.code,{children:"\u0431\u0435\u0437\u043e\u043f\u0430\u0441\u043d\u044b\u0439 \u0440\u0435\u0436\u0438\u043c"})," \u0438 ",(0,t.jsx)(e.code,{children:"\u0437\u0430\u0449\u0438\u0442\u0443 \u043e\u0442 \u043e\u043f\u0430\u0441\u043d\u044b\u0445 \u0434\u0435\u0439\u0441\u0442\u0432\u0438\u0439"})]})})}),"\n",(0,t.jsxs)(e.h2,{id:"\u0437\u0430\u043f\u0443\u0441\u043a-\u0438\u0437-1\u0441-development-tools-edt",children:["\u0417\u0430\u043f\u0443\u0441\u043a \u0438\u0437 1\u0421",":Enterprise"," Development Tools (EDT)"]}),"\n",(0,t.jsxs)(e.p,{children:["\u0415\u0441\u043b\u0438 \u0432\u044b \u0438\u0441\u043f\u043e\u043b\u044c\u0437\u0443\u0435\u0442\u0435 EDT, \u0442\u043e \u0443\u0441\u0442\u0430\u043d\u043e\u0432\u0438\u0432 ",(0,t.jsx)(e.a,{href:"/yaxunit/docs/getting-started/install/install-plugin",children:"\u043f\u043b\u0430\u0433\u0438\u043d"})," \u0432\u044b \u043f\u043e\u043b\u0443\u0447\u0430\u0435\u0442\u0435 \u0432\u043e\u0437\u043c\u043e\u0436\u043d\u043e\u0441\u0442\u044c \u0437\u0430\u043f\u0443\u0441\u043a\u0430\u0442\u044c \u0442\u0435\u0441\u0442\u044b \u043d\u0430\u0436\u0430\u0442\u0438\u0435\u043c \u043e\u0434\u043d\u043e\u0439 \u043a\u043d\u043e\u043f\u043a\u0438."]}),"\n",(0,t.jsx)(e.admonition,{type:"info",children:(0,t.jsx)(e.p,{children:"\u0412\u0441\u0435 \u043e\u043f\u0438\u0441\u0430\u043d\u043d\u044b\u0435 \u043d\u0438\u0436\u0435 \u0441\u043f\u043e\u0441\u043e\u0431\u044b \u043f\u043e\u0437\u0432\u043e\u043b\u044f\u044e\u0442 \u0437\u0430\u043f\u0443\u0441\u043a\u0430\u0442\u044c \u0442\u0435\u0441\u0442\u044b \u0432 \u0440\u0435\u0436\u0438\u043c\u0435 \u043e\u0442\u043b\u0430\u0434\u043a\u0438"})}),"\n",(0,t.jsx)(e.h3,{id:"\u043a\u043e\u043d\u0444\u0438\u0433\u0443\u0440\u0430\u0446\u0438\u044f-\u0437\u0430\u043f\u0443\u0441\u043a\u0430",children:"\u041a\u043e\u043d\u0444\u0438\u0433\u0443\u0440\u0430\u0446\u0438\u044f \u0437\u0430\u043f\u0443\u0441\u043a\u0430"}),"\n",(0,t.jsx)(e.p,{children:"\u041f\u043b\u0430\u0433\u0438\u043d \u0434\u043e\u0431\u0430\u0432\u043b\u044f\u0435\u0442 \u0432 EDT \u043d\u043e\u0432\u044b\u0439 \u0442\u0438\u043f \u043a\u043e\u043d\u0444\u0438\u0433\u0443\u0440\u0430\u0446\u0438\u0438 \u0437\u0430\u043f\u0443\u0441\u043a\u0430 \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u044f."}),"\n",(0,t.jsx)(e.p,{children:(0,t.jsx)(e.img,{alt:"EDT",src:i(1581).A+"",width:"825",height:"541"})}),"\n",(0,t.jsx)(e.p,{children:"\u0421 \u0435\u0435 \u043f\u043e\u043c\u043e\u0449\u044c\u044e \u0432\u044b \u043c\u043e\u0436\u0435\u0442\u0435 \u0437\u0430\u043f\u0443\u0441\u043a\u0430\u0442\u044c \u0442\u0435\u0441\u0442\u044b \u0442\u0430\u043a\u0436\u0435 \u043a\u0430\u043a \u0438 1\u0421:\u041f\u0440\u0435\u0434\u043f\u0440\u0438\u044f\u0442\u0438\u0435 (\u043a\u043d\u043e\u043f\u043a\u043e\u0439 \u043f\u0430\u043d\u0435\u043b\u0438 \u0438\u043d\u0441\u0442\u0440\u0443\u043c\u0435\u043d\u0442\u043e\u0432)"}),"\n",(0,t.jsx)(e.p,{children:(0,t.jsx)(e.img,{alt:"EDT",src:i(375).A+"",width:"275",height:"173"})}),"\n",(0,t.jsx)(e.admonition,{title:"\u0412\u0430\u0436\u043d\u043e",type:"caution",children:(0,t.jsx)(e.p,{children:"\u0411\u0435\u0437 \u0441\u043e\u0437\u0434\u0430\u043d\u043d\u043e\u0439 \u0438 \u043d\u0430\u0441\u0442\u0440\u043e\u0435\u043d\u043d\u043e\u0439 \u043a\u043e\u043d\u0444\u0438\u0433\u0443\u0440\u0430\u0446\u0438\u0438 \u0437\u0430\u043f\u0443\u0441\u043a\u0430 \u043c\u043e\u0434\u0443\u043b\u044c\u043d\u044b\u0445 \u0442\u0435\u0441\u0442\u043e\u0432 \u043d\u0435 \u0431\u0443\u0434\u0443\u0442 \u0440\u0430\u0431\u043e\u0442\u0430\u0442\u044c \u0434\u0440\u0443\u0433\u0438\u0435 \u0432\u0430\u0440\u0438\u0430\u043d\u0442\u044b \u0437\u0430\u043f\u0443\u0441\u043a\u0430."})}),"\n",(0,t.jsx)(e.h3,{id:"\u0437\u0430\u043f\u0443\u0441\u043a-\u0438\u0437-\u0431\u043e\u043a\u043e\u0432\u043e\u0439-\u043f\u0430\u043d\u0435\u043b\u0438-\u043c\u043e\u0434\u0443\u043b\u044f",children:"\u0417\u0430\u043f\u0443\u0441\u043a \u0438\u0437 \u0431\u043e\u043a\u043e\u0432\u043e\u0439 \u043f\u0430\u043d\u0435\u043b\u0438 \u043c\u043e\u0434\u0443\u043b\u044f"}),"\n",(0,t.jsxs)(e.p,{children:["\u0422\u0430\u043a\u0436\u0435 \u043f\u043b\u0430\u0433\u0438\u043d \u043f\u043e\u0437\u0432\u043e\u043b\u044f\u0435\u0442 \u0437\u0430\u043f\u0443\u0441\u043a\u0430\u0442\u044c \u0442\u0435\u0441\u0442\u044b \u043f\u0440\u044f\u043c\u043e \u0438\u0437 \u043c\u043e\u0434\u0443\u043b\u044f \u0434\u043b\u044f \u043d\u0443\u0436\u043d\u044b\u0445 \u043c\u0435\u0442\u043e\u0434\u043e\u0432.",(0,t.jsx)(e.br,{}),"\n","\u0415\u0441\u043b\u0438 \u0432\u044b \u043f\u0435\u0440\u0435\u0439\u0434\u0435\u0442\u0435 \u0432 \u043c\u043e\u0434\u0443\u043b\u044c \u0441 \u0442\u0435\u0441\u0442\u0430\u043c\u0438, \u0442\u043e \u0440\u044f\u0434\u043e\u043c \u0441 \u043a\u0430\u0436\u0434\u044b\u043c \u0442\u0435\u0441\u0442\u043e\u0432\u044b\u043c \u043c\u0435\u0442\u043e\u0434\u043e\u043c \u0432\u044b \u0443\u0432\u0438\u0434\u0438\u0442\u0435 \u0438\u043a\u043e\u043d\u043a\u0438 \u0437\u0430\u043f\u0443\u0441\u043a\u0430."]}),"\n",(0,t.jsx)(e.p,{children:(0,t.jsx)(e.img,{alt:"EDT",src:i(7978).A+"",width:"665",height:"728"})}),"\n",(0,t.jsxs)(e.p,{children:["\u041a\u043b\u0438\u043a\u043d\u0443\u0432 \u043f\u043e \u043d\u0438\u043c \u0432\u044b \u0441\u043c\u043e\u0436\u0435\u0442\u0435 \u0437\u0430\u043f\u0443\u0441\u0442\u0438\u0442\u044c \u043a\u043e\u043d\u043a\u0440\u0435\u0442\u043d\u044b\u0439 \u0442\u0435\u0441\u0442.",(0,t.jsx)(e.br,{}),"\n","\u041f\u0440\u0438 \u043d\u0430\u0436\u0430\u0442\u0438\u0438 \u043d\u0430 \u0438\u043a\u043e\u043d\u043a\u0443 \u043c\u0435\u0442\u043e\u0434\u0430 ",(0,t.jsx)(e.code,{children:"\u0418\u0441\u043f\u043e\u043b\u043d\u044f\u0435\u043c\u044b\u0435\u0421\u0446\u0435\u043d\u0430\u0440\u0438\u0438"})," \u0432\u044b \u0437\u0430\u043f\u0443\u0441\u0442\u0438\u0442\u0435 \u0432\u0441\u0435 \u0442\u0435\u0441\u0442\u044b \u043c\u043e\u0434\u0443\u043b\u044f."]}),"\n",(0,t.jsx)(e.p,{children:"\u041a\u043e\u043c\u0430\u043d\u0434\u044b \u0437\u0430\u043f\u0443\u0441\u043a\u0430 \u0434\u043e\u0431\u0430\u0432\u043b\u0435\u043d\u044b \u0432 \u0441\u0445\u0435\u043c\u0443 \u043c\u043e\u0434\u0443\u043b\u044f."}),"\n",(0,t.jsx)(e.p,{children:(0,t.jsx)(e.img,{alt:"EDT",src:i(6763).A+"",width:"461",height:"491"})}),"\n",(0,t.jsx)(e.h3,{id:"\u0437\u0430\u043f\u0443\u0441\u043a-\u0438\u0437-\u043f\u0430\u043b\u0438\u0442\u0440\u044b-\u043a\u043e\u043c\u0430\u043d\u0434",children:"\u0417\u0430\u043f\u0443\u0441\u043a \u0438\u0437 \u043f\u0430\u043b\u0438\u0442\u0440\u044b \u043a\u043e\u043c\u0430\u043d\u0434"}),"\n",(0,t.jsx)(e.p,{children:"\u041f\u043b\u0430\u0433\u0438\u043d \u0434\u043e\u0431\u0430\u0432\u043b\u044f\u0435\u0442 \u043d\u0430\u0431\u043e\u0440 \u0440\u0430\u0437\u043b\u0438\u0447\u043d\u044b\u0445 \u043a\u043e\u043c\u0430\u043d\u0434 \u0434\u043b\u044f \u0440\u0430\u0431\u043e\u0442\u044b \u0441 \u0442\u0435\u0441\u0442\u0430\u043c\u0438, \u0441\u0440\u0435\u0434\u0438 \u043a\u043e\u0442\u043e\u0440\u044b\u0445 \u0435\u0441\u0442\u044c \u0438 \u0437\u0430\u043f\u0443\u0441\u043a."}),"\n",(0,t.jsx)(e.p,{children:(0,t.jsx)(e.img,{alt:"EDT",src:i(7741).A+"",width:"909",height:"847"})}),"\n",(0,t.jsxs)(e.p,{children:["\u041e\u0441\u043d\u043e\u0432\u043d\u044b\u043c \u0435\u0435 \u043f\u043b\u044e\u0441\u043e\u043c \u044f\u0432\u043b\u044f\u0435\u0442\u0441\u044f \u0432\u043e\u0437\u043c\u043e\u0436\u043d\u043e\u0441\u0442\u044c \u0440\u0430\u0431\u043e\u0442\u0430\u0442\u044c \u0441 \u043a\u043b\u0430\u0432\u0438\u0430\u0442\u0443\u0440\u044b \u0438 \u043d\u0435 \u0437\u0430\u043f\u043e\u043c\u0438\u043d\u0430\u0442\u044c \u0431\u043e\u043b\u044c\u0448\u043e\u0435 \u043a\u043e\u043b\u0438\u0447\u0435\u0441\u0442\u0432\u043e \u0433\u043e\u0440\u044f\u0447\u0438\u0445 \u043a\u043b\u0430\u0432\u0438\u0448.\n",(0,t.jsx)(e.code,{children:"Ctrl+Shift+T"}),", \u0437\u0430\u0442\u0435\u043c ",(0,t.jsx)(e.code,{children:"Enter"})," \u0438 \u0442\u0435\u0441\u0442 \u0442\u0435\u043a\u0443\u0449\u0435\u0433\u043e \u043c\u0435\u0442\u043e\u0434\u0430 \u0437\u0430\u043f\u0443\u0449\u0435\u043d."]}),"\n",(0,t.jsx)(e.h2,{id:"\u0437\u0430\u043f\u0443\u0441\u043a-\u0438\u0437-\u043a\u043e\u043d\u0444\u0438\u0433\u0443\u0440\u0430\u0442\u043e\u0440\u0430",children:"\u0417\u0430\u043f\u0443\u0441\u043a \u0438\u0437 \u043a\u043e\u043d\u0444\u0438\u0433\u0443\u0440\u0430\u0442\u043e\u0440\u0430"}),"\n",(0,t.jsx)(e.p,{children:"\u0412\u043e\u0437\u043c\u043e\u0436\u043d\u043e\u0441\u0442\u0438 \u043a\u043e\u043d\u0444\u0438\u0433\u0443\u0440\u0430\u0442\u043e\u0440\u0430 \u043d\u0435 \u0441\u0442\u043e\u043b\u044c \u0431\u043e\u043b\u044c\u0448\u0438\u0435, \u043f\u043e\u044d\u0442\u043e\u043c\u0443 \u0435\u0441\u0442\u044c \u0442\u043e\u043b\u044c\u043a\u043e \u043e\u0434\u0438\u043d \u0441\u043f\u043e\u0441\u043e\u0431 \u0437\u0430\u043f\u0443\u0441\u0442\u0438\u0442\u044c \u0442\u0435\u0441\u0442\u044b."}),"\n",(0,t.jsxs)(e.ol,{children:["\n",(0,t.jsxs)(e.li,{children:["\n",(0,t.jsx)(e.p,{children:"\u0421\u043e\u0437\u0434\u0430\u0442\u044c \u0444\u0430\u0439\u043b \u043a\u043e\u043d\u0444\u0438\u0433\u0443\u0440\u0430\u0446\u0438\u0438 \u0437\u0430\u043f\u0443\u0441\u043a\u0430"}),"\n",(0,t.jsxs)(e.ul,{children:["\n",(0,t.jsx)(e.li,{children:(0,t.jsx)(e.a,{href:"/yaxunit/docs/getting-started/run/configuration",children:"\u0412\u0440\u0443\u0447\u043d\u0443\u044e"})}),"\n",(0,t.jsxs)(e.li,{children:["\u0421 \u043f\u043e\u043c\u043e\u0449\u044c\u044e ",(0,t.jsx)(e.a,{href:"/yaxunit/docs/yaxunit-ui#%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D1%84%D0%B5%D0%B9%D1%81-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8-%D0%BA%D0%BE%D0%BD%D1%84%D0%B8%D0%B3%D1%83%D1%80%D0%B0%D1%86%D0%B8%D0%B8",children:"\u0444\u043e\u0440\u043c\u044b \u043d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0438"})]}),"\n"]}),"\n"]}),"\n",(0,t.jsxs)(e.li,{children:["\n",(0,t.jsx)(e.p,{children:"\u0423\u043a\u0430\u0437\u0430\u0442\u044c \u043f\u0443\u0442\u044c \u043a \u0444\u0430\u0439\u043b\u0443 \u043a\u043e\u043d\u0444\u0438\u0433\u0443\u0440\u0430\u0446\u0438\u0438 \u0437\u0430\u043f\u0443\u0441\u043a\u0430 \u0432 \u043f\u0430\u0440\u0430\u043c\u0435\u0442\u0440\u0430\u0445 \u0437\u0430\u043f\u0443\u0441\u043a\u0430"}),"\n",(0,t.jsx)(e.p,{children:(0,t.jsx)(e.img,{alt:"\u041a\u043e\u043d\u0444\u0438\u0433\u0443\u0440\u0430\u0442\u043e\u0440",src:i(5285).A+"",width:"523",height:"619"})}),"\n"]}),"\n"]}),"\n",(0,t.jsx)(e.admonition,{type:"tip",children:(0,t.jsxs)(e.p,{children:["\u041f\u0440\u0438 \u0440\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u043a\u0438/\u043e\u0442\u043b\u0430\u0434\u043a\u0435 \u0442\u0435\u0441\u0442\u043e\u0432 \u043f\u043e\u043b\u0435\u0437\u043d\u043e \u0434\u0435\u0440\u0436\u0430\u0442\u044c \u043e\u0442\u043a\u0440\u044b\u0442\u043e\u0439 ",(0,t.jsx)(e.a,{href:"/yaxunit/docs/yaxunit-ui#%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D1%84%D0%B5%D0%B9%D1%81-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8-%D0%BA%D0%BE%D0%BD%D1%84%D0%B8%D0%B3%D1%83%D1%80%D0%B0%D1%86%D0%B8%D0%B8",children:"\u0444\u043e\u0440\u043c\u0443 \u043d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0438"}),' \u0434\u043b\u044f \u0431\u044b\u0441\u0442\u0440\u043e\u0439 \u043f\u0435\u0440\u0435\u043d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0438 \u0437\u0430\u043f\u0443\u0441\u043a\u0430\u0435\u043c\u044b\u0445 \u0442\u0435\u0441\u0442\u043e\u0432. \u0421\u043d\u0430\u0447\u0430\u043b\u0430 \u0437\u0430\u043f\u0443\u0441\u0442\u0438\u043b \u0442\u0435\u0441\u0442\u044b \u043c\u043e\u0434\u0443\u043b\u044f, \u043f\u043e\u0442\u043e\u043c \u0432 \u0442\u043e\u0439 \u0436\u0435 \u0444\u043e\u0440\u043c\u0435 \u0443\u0431\u0440\u0430\u043b\u0438 "\u0437\u0435\u043b\u0435\u043d\u044b\u0435", \u0441\u043e\u0445\u0440\u0430\u043d\u0438\u043b\u0438 \u043d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0443 \u0432 \u0442\u043e\u0442 \u0436\u0435 \u0444\u0430\u0439\u043b \u0438 \u0432\u044b\u043f\u043e\u043b\u043d\u0438\u043b\u0438 \u043e\u0442\u043b\u0430\u0434\u043a\u0443 \u043d\u0443\u0436\u043d\u044b\u0445 \u0442\u0435\u0441\u0442\u043e\u0432, \u0437\u0430\u043f\u0443\u0441\u0442\u0438\u0432 \u0438\u0445 \u0438\u0437 \u043a\u043e\u043d\u0444\u0438\u0433\u0443\u0440\u0430\u0442\u043e\u0440.']})}),"\n",(0,t.jsx)(e.h2,{id:"\u0437\u0430\u043f\u0443\u0441\u043a-\u0438\u0437-\u043f\u0440\u0435\u0434\u043f\u0440\u0438\u044f\u0442\u0438\u044f",children:"\u0417\u0430\u043f\u0443\u0441\u043a \u0438\u0437 \u043f\u0440\u0435\u0434\u043f\u0440\u0438\u044f\u0442\u0438\u044f"}),"\n",(0,t.jsxs)(e.p,{children:["\u0414\u043b\u044f \u0437\u0430\u043f\u0443\u0441\u043a\u0430 \u0442\u0435\u0441\u0442\u043e\u0432 \u0438\u0437 \u043f\u0440\u0435\u0434\u043f\u0440\u0438\u044f\u0442\u0438\u044f \u043d\u0435\u043e\u0431\u0445\u043e\u0434\u0438\u043c\u043e \u0432\u043e\u0441\u043f\u043e\u043b\u044c\u0437\u043e\u0432\u0430\u0442\u044c\u0441\u044f \u043a\u043e\u043c\u0430\u043d\u0434\u043e\u0439 ",(0,t.jsx)(e.a,{href:"/yaxunit/docs/yaxunit-ui#%D0%B7%D0%B0%D0%BF%D1%83%D1%81%D0%BA-%D1%82%D0%B5%D1%81%D1%82%D0%BE%D0%B2",children:"\u0417\u0430\u043f\u0443\u0441\u043a \u0442\u0435\u0441\u0442\u0438\u0440\u043e\u0432\u0430\u043d\u0438\u044f"})]}),"\n",(0,t.jsx)(e.p,{children:(0,t.jsx)(e.img,{alt:"\u0417\u0430\u043f\u0443\u0441\u043a \u0442\u0435\u0441\u0442\u043e\u0432",src:i(510).A+"",width:"1206",height:"229"})}),"\n",(0,t.jsx)(e.h2,{id:"\u0441\u0442\u0440\u043e\u043a\u0430-\u0437\u0430\u043f\u0443\u0441\u043a\u0430-\u043f\u0440\u0435\u0434\u043f\u0440\u0438\u044f\u0442\u0438\u044f",children:"\u0421\u0442\u0440\u043e\u043a\u0430 \u0437\u0430\u043f\u0443\u0441\u043a\u0430 \u043f\u0440\u0435\u0434\u043f\u0440\u0438\u044f\u0442\u0438\u044f"}),"\n",(0,t.jsx)(e.p,{children:(0,t.jsx)(e.code,{children:"[\u043f\u0443\u0442\u044c \u043a \u043a\u043b\u0438\u0435\u043d\u0442\u0443 1\u0421] ENTERPRISE [\u041f\u0430\u0440\u0430\u043c\u0435\u0442\u0440\u044b \u043f\u043e\u0434\u043a\u043b\u044e\u0447\u0435\u043d\u0438\u044f \u043a \u0418\u0411] [\u041f\u0430\u0440\u0430\u043c\u0435\u0442\u0440\u044b \u0430\u0432\u0442\u043e\u0440\u0438\u0437\u0430\u0446\u0438\u0438] /C RunUnitTests=/\u043f\u0443\u0442\u044c/\u043a/\u043a\u043e\u043d\u0444\u0438\u0433\u0443\u0440\u0430\u0446\u0438\u043e\u043d\u043d\u043e\u043c\u0443/\u0444\u0430\u0439\u043b\u0443"})}),"\n",(0,t.jsxs)(e.p,{children:["\u0414\u043b\u044f \u0444\u043e\u0440\u043c\u0438\u0440\u043e\u0432\u0430\u043d\u0438\u044f \u0441\u0442\u0440\u043e\u043a\u0438 \u0437\u0430\u043f\u0443\u0441\u043a\u0430 \u043c\u043e\u0436\u043d\u043e \u0432\u043e\u0441\u043f\u043e\u043b\u044c\u0437\u043e\u0432\u0430\u0442\u044c\u0441\u044f ",(0,t.jsx)(e.a,{href:"/yaxunit/docs/yaxunit-ui#%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D1%84%D0%B5%D0%B9%D1%81-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8-%D0%BA%D0%BE%D0%BD%D1%84%D0%B8%D0%B3%D1%83%D1%80%D0%B0%D1%86%D0%B8%D0%B8",children:"\u0438\u043d\u0442\u0435\u0440\u0444\u0435\u0439\u0441\u043e\u043c \u043d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0438"})]}),"\n",(0,t.jsx)(e.p,{children:"\u041f\u0440\u0438\u043c\u0435\u0440:"}),"\n",(0,t.jsxs)(e.p,{children:[(0,t.jsx)(e.code,{children:'"C:\\Program Files\\1cv8\\8.3.18.1698\\bin\\1cv8c.exe" ENTERPRISE /IBName MyInfoBase /N Admin /C RunUnitTests=C:\\tmp\\test-config.json'}),"\n\u0417\u0430\u043f\u0443\u0441\u043a \u0442\u0435\u0441\u0442\u043e\u0432 \u0432 \u0440\u0435\u0436\u0438\u043c\u0435 \u0442\u043e\u043d\u043a\u043e\u0433\u043e \u043a\u043b\u0438\u0435\u043d\u0442\u0430 \u043d\u0430 \u0438\u043d\u0444\u043e\u0440\u043c\u0430\u0446\u0438\u043e\u043d\u043d\u043e\u0439 \u0431\u0430\u0437\u0435 ",(0,t.jsx)(e.code,{children:"MyInfoBase"})," \u043f\u043e\u0434 \u043f\u043e\u043b\u044c\u0437\u043e\u0432\u0430\u0442\u0435\u043b\u0435\u043c ",(0,t.jsx)(e.code,{children:"Admin"})," \u043f\u043e \u043a\u043e\u043d\u0444\u0438\u0433\u0443\u0440\u0430\u0446\u0438\u0438 \u0443\u043a\u0430\u0437\u0430\u043d\u043d\u043e\u0439 \u0432 \u0444\u0430\u0439\u043b\u0435 ",(0,t.jsx)(e.code,{children:"C:\\tmp\\test-config.json"})]})]})}function h(n={}){const{wrapper:e}={...(0,s.R)(),...n.components};return e?(0,t.jsx)(e,{...n,children:(0,t.jsx)(o,{...n})}):o(n)}},5285:(n,e,i)=>{i.d(e,{A:()=>t});const t=i.p+"assets/images/from-configurator-ad519301279e3ea1a249f72e386a0593.png"},375:(n,e,i)=>{i.d(e,{A:()=>t});const t=i.p+"assets/images/run-button-55d76080fb1c0ec4c6e70fe7db5d3ecc.png"},1581:(n,e,i)=>{i.d(e,{A:()=>t});const t=i.p+"assets/images/run-configuration-d3aa6e6d973ec4b2080a9c0d9a938fa2.png"},7741:(n,e,i)=>{i.d(e,{A:()=>t});const t=i.p+"assets/images/run-from-command-palette-cd8d9c29fe5155b29157801256b28603.png"},7978:(n,e,i)=>{i.d(e,{A:()=>t});const t=i.p+"assets/images/run-from-module-6c418f5782ade1cc13370c03d91d0449.png"},6763:(n,e,i)=>{i.d(e,{A:()=>t});const t=i.p+"assets/images/run-from-schema-96d38f8ad26544d9e10a5f6f6fa41489.png"},510:(n,e,i)=>{i.d(e,{A:()=>t});const t=i.p+"assets/images/ui-run-tests-7006726a09b7b0a6c0a019e95f02061f.png"},8453:(n,e,i)=>{i.d(e,{R:()=>r,x:()=>c});var t=i(6540);const s={},d=t.createContext(s);function r(n){const e=t.useContext(d);return t.useMemo((function(){return"function"==typeof n?n(e):{...e,...n}}),[e,n])}function c(n){let e;return e=n.disableParentContext?"function"==typeof n.components?n.components(s):n.components||s:r(n.components),t.createElement(d.Provider,{value:e},n.children)}}}]);