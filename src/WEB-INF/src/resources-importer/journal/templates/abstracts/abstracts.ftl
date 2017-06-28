<#--
    abstracts.ftl: Format the abstracts structure
    
    Created:    2017-05-14 19:03 by Christian Berndt
    Modified:   2017-06-28 23:52 by Christian Berndt
    Version:    1.0.4
-->

<div class="abstracts">
    <div class="container">
        <#if headline??>
            <#if headline.getData()?has_content>
                <h1>${headline.getData()}</h1>
            </#if>
        </#if>
        
        <#if abstract??>
            <#if abstract.getSiblings()?has_content>
            
                <div class="row">
                
                    <#assign num_siblings = abstract.getSiblings()?size />
                    <#assign num_columns = 2 />
                    <#assign css_class = "col-md-6" />
                    
                    <#if num_siblings % 3 == 0>
                        <#assign css_class = "col-md-4" />
                        <#assign num_columns = 3 />                       
                    <#elseif num_siblings % 4 == 0 >
                        <#assign css_class = "col-md-3" />                    
                        <#assign num_columns = 4 />                       
                    </#if>
                
                    <#list abstract.getSiblings() as cur_abstract>
                    
                        <#assign idx = cur_abstract?index />
                        
                        <#if idx gt 0 && idx % num_columns == 0>
                            <#assign new_row = "</div><div class=\"row\">" />
                            ${new_row}
                        </#if>
                    
                        <div class="${css_class}">
                            <#--
                            <img src="" alt="TODO: alt" class="img-circle">
                            -->
                            <#if cur_abstract.getData()?has_content>
                                <h3>${cur_abstract.getData()}</h3>
                            </#if>
                            <#if cur_abstract.claim??>
                                <#if cur_abstract.claim.getData()?has_content>
                                    <p>${cur_abstract.claim.getData()}</p>
                                </#if>
                            </#if>
                        </div>
                    </#list>
                </div>
            </#if>
        </#if>
        
        <#if link??>
            <div class="row">
                <div class="common-link">
                    <a class="btn btn-info" href="${link.getFriendlyUrl()}">
                        ${label.getData()}
                    </a>
                </div>
            </div>
        </#if>
    </div>
</div>