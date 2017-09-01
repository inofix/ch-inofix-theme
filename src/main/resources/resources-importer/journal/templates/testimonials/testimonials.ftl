<#--
    testimonials.ftl: Format the testimonials structure
    
    Created:    2017-07-07 19:06 by Christian Berndt
    Modified:   2017-07-07 19:06 by Christian Berndt
    Version:    1.0.0
-->

<#assign color_scheme = "lightgray" />

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
                    
                        <div class="col-md-8 col-md-offset-2">
                            <div class="icon-wrapper">
                                <span class="icon icon-user"></span>
                            </div>
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