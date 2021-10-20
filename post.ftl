<!DOCTYPE html>
<html lang="zh-CN">
<#import "common/header.ftl" as headInfo>
<@headInfo.head title="${post.title!}" type="post"/>
<#import "common/tail.ftl" as tailInfo>
<body>
    <div id="Joe">
        <#include "common/navbar.ftl">
        <#include "common/post_bread.ftl">
        <script type="text/plain">
        </script>
        <div class="joe_container joe_main_container page-post">
            <div class="joe_main joe_post">
                <#if settings.enable_post_aside && settings.enable_aside_expander><span class="aside-expander">隐藏侧边栏</span></#if>
                <div class="joe_detail" data-cid="${post.id}" data-clikes="${post.likes}" data-curl="${post.fullPath}">
                    <#list categories as category>
                      <#if category_index==1>
                        <div class="joe_detail__category">
                            <a href="${category.fullPath}" class="item item-0" title="${category.name!}">${category.name!}</a>
                        </div>
                      </#if>
                    </#list>
                    <h1 class="joe_detail__title${settings.enable_title_shadow?string(' txt-shadow', '')}">${post.title!}</h1>
                    <div class="joe_detail__count">
                        <div class="joe_detail__count-information">
                            <img width="35" height="35" class="avatar lazyload" src="${settings.lazyload_avatar!}" data-src="${user.avatar!}" onerror="this.src='${settings.default_avatar!}'" alt="${user.nickname!}">
                            <div class="meta">
                                <div class="author">
                                    <a class="link" href="${blog_url}/s/about" title="${user.nickname!}">${user.nickname!}</a>
                                </div>
                                <div class="item">
                                    <span class="text">${post.createTime?string('yyyy-MM-dd')}</span>
                                    <span class="line">/</span>
                                    <span class="text">${post.commentCount} 评论</span>
                                    <span class="line">/</span>
                                    <span class="text" >${post.visits} 阅读</span>  
                                    <span class="line">/</span>
                                    <span class="text" >${post.wordCount!0} 字</span>
                                    <#if settings.check_baidu_collect!false>
                                      <span class="line">/</span>
                                      <span class="text" id="joe_baidu_record">正在检测是否收录...</span>
                                    </#if>
                                </div>
                            </div>
                        </div>
                        <time class="joe_detail__count-created" datetime="${post.createTime?string('MM/dd')}">${post.createTime?string('MM/dd')}</time>
                    </div>                    
                    <div class="joe_detail__overdue">
                        <#if settings.enable_passage_tips>
                            <div class="joe_detail__overdue-wrapper">
                                <div class="title">
                                    <svg class="icon" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg" width="20" height="20">
                                        <path d="M0 512c0 282.778 229.222 512 512 512s512-229.222 512-512S794.778 0 512 0 0 229.222 0 512z" fill="#FF8C00" fill-opacity=".51" />
                                        <path d="M462.473 756.326a45.039 45.039 0 0 0 41.762 28.74 45.039 45.039 0 0 0 41.779-28.74h-83.541zm119.09 0c-7.73 35.909-39.372 62.874-77.311 62.874-37.957 0-69.598-26.965-77.33-62.874H292.404a51.2 51.2 0 0 1-42.564-79.65l23.723-35.498V484.88a234.394 234.394 0 0 1 167.492-224.614c3.635-31.95 30.498-56.815 63.18-56.815 31.984 0 58.386 23.808 62.925 54.733A234.394 234.394 0 0 1 742.093 484.88v155.512l24.15 36.454a51.2 51.2 0 0 1-42.668 79.48H581.564zm-47.957-485.922c.069-.904.12-1.809.12-2.73 0-16.657-13.26-30.089-29.491-30.089-16.214 0-29.474 13.432-29.474 30.089 0 1.245.085 2.491.221 3.703l1.81 15.155-14.849 3.499a200.226 200.226 0 0 0-154.265 194.85v166.656l-29.457 44.1a17.067 17.067 0 0 0 14.182 26.556h431.155a17.067 17.067 0 0 0 14.234-26.487l-29.815-45.04V484.882A200.21 200.21 0 0 0 547.26 288.614l-14.985-2.986 1.331-15.224z" fill="#FFF" />
                                        <path d="M612.864 322.697c0 30.378 24.303 55.022 54.272 55.022 30.003 0 54.323-24.644 54.323-55.022 0-30.38-24.32-55.023-54.306-55.023s-54.306 24.644-54.306 55.023z" fill="#FA5252" />
                                    </svg>
                                    <span class="text">温馨提示：</span>
                                </div>
                                <div class="content">
                                    本文最后更新于${post.createTime?string('yyyy-MM-dd')}，若内容或图片失效，请留言反馈。
                                    部分素材来自网络，若不小心影响到您的利益，请联系我们删除。
                                </div>
                            </div>
                        </#if>
                    </div>
                    <article class="joe_detail__article animated fadeInUp${settings.enable_code_line_number?string(' line-numbers', '')}${settings.enable_copy?string(' copyable', '')}${settings.enable_indent?string(' indent','')}">
                        ${post.formatContent!}
                    </article>
                    <#if settings.enable_toc!true>
                      <div class="toc-container">
                          <div class="toc-expander">
                              <i class="joe-font joe-icon-expand-in" title="收起文章目录"></i>
                              <i class="joe-font joe-icon-expand-out" title="展开文章目录"></i>
                          </div>
                          <div id="js-toc" class="toc"></div>
                      </div>
                    </#if>
                    <#if settings.enable_like!true>
                      <#include "common/favorite.ftl">
                    </#if>
                    <#include "common/post_operate.ftl">
                    <#import "common/post_copyright.ftl" as pc>
                    <@pc.post_copyright post_url="${post.fullPath}"/>
                    <#include "common/ads/ads_large.ftl">
                </div>
                <ul class="joe_post__pagination">
                    <#if prevPost??>
                        <li class="joe_post__pagination-item prev"><a href="${prevPost.fullPath!}" title="${prevPost.title!}">上一篇</a></li>
                    </#if>
                    <#if nextPost??>
                        <li class="joe_post__pagination-item next"><a href="${nextPost.fullPath!}" title="${nextPost.title!}">下一篇</a></li>
                    </#if>
                </ul>
                <#--  <iframe src="http://192.168.18.229:8080/" width="100%" height="500" style="background: #fff;"></iframe>  -->
                <#if settings.enable_comment>
                  <div class="joe_comment">
                    <#if post.disallowComment=true>
                      <div class="joe_comment__close">
                        <svg class="joe_comment__close-icon" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg" width="18" height="18">
                            <path d="M512.307.973c282.317 0 511.181 201.267 511.181 449.587a402.842 402.842 0 0 1-39.27 173.26 232.448 232.448 0 0 0-52.634-45.977c16.384-39.782 25.293-82.688 25.293-127.283 0-211.098-199.117-382.157-444.621-382.157-245.555 0-444.57 171.06-444.57 382.157 0 133.427 79.514 250.88 200.039 319.18v107.982l102.041-65.127a510.157 510.157 0 0 0 142.49 20.122l19.405-.359c19.405-.716 38.758-2.508 57.958-5.427l3.584 13.415a230.607 230.607 0 0 0 22.323 50.688l-20.633 3.328a581.478 581.478 0 0 1-227.123-12.288L236.646 982.426c-19.66 15.001-35.635 7.168-35.635-17.664v-157.39C79.411 725.198 1.024 595.969 1.024 450.56 1.024 202.24 229.939.973 512.307.973zm318.464 617.011c97.485 0 176.794 80.435 176.794 179.2S928.256 976.23 830.77 976.23c-97.433 0-176.742-80.281-176.742-179.046 0-98.816 79.309-179.149 176.742-179.149zM727.757 719.002a131.174 131.174 0 0 0-25.754 78.182c0 71.885 57.805 130.406 128.768 130.406 28.877 0 55.552-9.625 77.056-26.01zm103.014-52.327c-19.712 0-39.117 4.557-56.678 13.312L946.33 854.58c8.499-17.305 13.158-36.864 13.158-57.395 0-71.987-57.805-130.509-128.717-130.509zM512.307 383.13l6.861.358a67.072 67.072 0 0 1 59.853 67.072l-.307 6.86a67.072 67.072 0 0 1-66.407 60.57l-6.81-.358a67.072 67.072 0 0 1-59.852-67.072 67.072 67.072 0 0 1 66.662-67.43zm266.752 0l6.861.358a67.072 67.072 0 0 1 59.853 67.072l-.307 6.86a67.072 67.072 0 0 1-66.407 60.57l-6.81-.358a67.072 67.072 0 0 1-59.852-67.072h-.051l.307-6.86a67.072 67.072 0 0 1 66.406-60.57zm-533.504 0l6.861.358a67.072 67.072 0 0 1 59.853 67.072l-.307 6.86a67.072 67.072 0 0 1-66.407 60.57l-6.81-.358a67.072 67.072 0 0 1-59.852-67.072 67.072 67.072 0 0 1 66.662-67.43z" />
                        </svg>
                            <span>博主关闭了当前页面的评论</span>
                      </div>
                    <#else>
                      <#--  <@global.comment target=post type="post" />  -->
                      <#include "common/comment.ftl">
                      <@comment target=post type="post"/>
                    </#if>
                  </div>
                <#else>
                  <div class="joe_comment">
                    <div class="joe_comment__close">
                      <svg class="joe_comment__close-icon" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg" width="18" height="18">
                          <path d="M512.307.973c282.317 0 511.181 201.267 511.181 449.587a402.842 402.842 0 0 1-39.27 173.26 232.448 232.448 0 0 0-52.634-45.977c16.384-39.782 25.293-82.688 25.293-127.283 0-211.098-199.117-382.157-444.621-382.157-245.555 0-444.57 171.06-444.57 382.157 0 133.427 79.514 250.88 200.039 319.18v107.982l102.041-65.127a510.157 510.157 0 0 0 142.49 20.122l19.405-.359c19.405-.716 38.758-2.508 57.958-5.427l3.584 13.415a230.607 230.607 0 0 0 22.323 50.688l-20.633 3.328a581.478 581.478 0 0 1-227.123-12.288L236.646 982.426c-19.66 15.001-35.635 7.168-35.635-17.664v-157.39C79.411 725.198 1.024 595.969 1.024 450.56 1.024 202.24 229.939.973 512.307.973zm318.464 617.011c97.485 0 176.794 80.435 176.794 179.2S928.256 976.23 830.77 976.23c-97.433 0-176.742-80.281-176.742-179.046 0-98.816 79.309-179.149 176.742-179.149zM727.757 719.002a131.174 131.174 0 0 0-25.754 78.182c0 71.885 57.805 130.406 128.768 130.406 28.877 0 55.552-9.625 77.056-26.01zm103.014-52.327c-19.712 0-39.117 4.557-56.678 13.312L946.33 854.58c8.499-17.305 13.158-36.864 13.158-57.395 0-71.987-57.805-130.509-128.717-130.509zM512.307 383.13l6.861.358a67.072 67.072 0 0 1 59.853 67.072l-.307 6.86a67.072 67.072 0 0 1-66.407 60.57l-6.81-.358a67.072 67.072 0 0 1-59.852-67.072 67.072 67.072 0 0 1 66.662-67.43zm266.752 0l6.861.358a67.072 67.072 0 0 1 59.853 67.072l-.307 6.86a67.072 67.072 0 0 1-66.407 60.57l-6.81-.358a67.072 67.072 0 0 1-59.852-67.072h-.051l.307-6.86a67.072 67.072 0 0 1 66.406-60.57zm-533.504 0l6.861.358a67.072 67.072 0 0 1 59.853 67.072l-.307 6.86a67.072 67.072 0 0 1-66.407 60.57l-6.81-.358a67.072 67.072 0 0 1-59.852-67.072 67.072 67.072 0 0 1 66.662-67.43z" />
                      </svg>
                      <span>博主关闭了所有页面的评论</span>
                    </div>
                  </div>
                </#if>
            </div>
            <#if settings.enable_post_aside!false>
              <#include "common/aside.ftl">
            </#if>
        </div>
        <#include "common/footer.ftl">
    </div>
    <@tailInfo.tail type="post"/>
</body>
</html>