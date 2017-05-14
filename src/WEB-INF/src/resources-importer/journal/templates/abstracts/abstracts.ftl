<#--
    abstracts.ftl: Format the abstracts structure
    
    Created:    2017-05-14 19:03 by Christian Berndt
    Modified:   2017-05-14 19:03 by Christian Berndt
    Version:    1.0.0
-->

<div class="abstracts">
    <#if headline??>
        <#if headline.getData()?has_content>
            <h1>${headline.getData()}</h1>
        </#if>
    </#if>
    
    <#if abstract??>
        <#if abstract.getSiblings()?has_content>
        
            <#assign num_siblings = abstract.getSiblings()?size />
            
            <#-- num_siblings = ${num_siblings} -->
            
            <#list abstract.getSiblings() as cur_abstract>
                <div class="col-md-4">
                    <#if cur_abstract.getData()?has_content>
                        <h2>${cur_abstract.getData()}</h2>
                    </#if>
                    <#if cur_abstract.claim??>
                        <#if cur_abstract.claim.getData()?has_content>
                            <p class="lead">${cur_abstract.claim.getData()}</p>
                        </#if>
                    </#if>
                </div>
            </#list>
        </#if>
    </#if>
    
    <#if link??>
        <a href="${link.getFriendlyUrl()}">
            ${label.getData()}
        </a>
    </#if>
</div>