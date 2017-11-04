<#--
    testimonials.ftl: Format the testimonials structure
    
    Created:    2017-07-07 19:06 by Christian Berndt
    Modified:   2017-11-04 21:49 by Christian Berndt
    Version:    1.0.1
-->

<#assign color_scheme = "white" />

<div class="testimonials ${color_scheme}">
    <div class="container">
        <#if headline??>
            <#if headline.getData()?has_content>
                <h1>${headline.getData()}</h1>
            </#if>
        </#if>
        
        <#if quote??>
            <#if quote.getSiblings()?has_content>
            
                <div class="row">
                
                    <#list quote.getSiblings() as cur_quote>
                    
                        <div class="col-md-2 col-md-offset-1">
                            <#assign portrait = ""/>
                            <#if cur_quote.portrait?? && cur_quote.portrait.getData()?has_content>
                                <#assign portrait = cur_quote.portrait.getData() />   
                            </#if>
                            <#if !portrait?has_content>
                            <div class="icon-wrapper">
                                <span class="icon icon-user"></span>
                            </div> 
                            <#else>
                                <img src="${portrait}" alt="${cur_quote.author.getData()}" title="${cur_quote.author.getData()}" class="img-circle">
                            </#if>                       
                        </div>
                        <div class="col-md-7">
                            <blockquote>
                                <#if cur_quote.getData()?has_content>
                                    <p>${cur_quote.getData()}</p>
                                </#if>
                                <#if cur_quote.author?? && cur_quote.author.getData()?has_content>
                                    <footer>
                                        ${cur_quote.author.getData()} 
                                        <#if cur_quote.position?? && cur_quote.position.getData()?has_content>                                       
                                            <cite title="${cur_quote.position.getData()} ">${cur_quote.position.getData()} </cite>
                                        </#if>
                                    </footer>
                                </#if>
                            </blockquote>
                        </div>
                    </#list>
                </div>
            </#if>
        </#if>
    </div>
</div>