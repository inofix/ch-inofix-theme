<#--
    abstracts.ftl: Format the abstracts structure
    
    Created:    2017-05-14 19:03 by Christian Berndt
    Modified:   2017-06-28 18:34 by Christian Berndt
    Version:    1.0.3
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
                    
                    <#-- num_siblings = ${num_siblings} -->
                
                    <#list abstract.getSiblings() as cur_abstract>
                        <div class="col-md-4">
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