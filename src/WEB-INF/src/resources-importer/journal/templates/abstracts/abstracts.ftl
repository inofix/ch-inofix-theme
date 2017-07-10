<#--
    abstracts.ftl: Format the abstracts structure
    
    Created:    2017-05-14 19:03 by Christian Berndt
    Modified:   2017-07-10 19:06 by Christian Berndt
    Version:    1.1.1
-->

<#assign color_scheme = "white" />

<#if colorScheme?? && colorScheme.getData()?has_content>
    <#assign color_scheme = colorScheme.getData() />
</#if>

<div class="abstracts ${color_scheme}">
    <div class="container">
        <#if headline?? && headline.getData()?has_content>
            <h1>${headline.getData()}</h1>
        </#if>

        <#if subHeadline?? && subHeadline.getData()?has_content>
            <h4>${subHeadline.getData()}</h4>
        </#if>
        
        <#if abstract?? && abstract.getSiblings()?has_content>
            
            <div class="row">
            
                <#assign num_siblings = abstract.getSiblings()?size />
                <#assign num_columns = 2 />
                <#assign css_class = "col-md-4 col-md-offset-1 col-sm-4 col-sm-offset-1" />
                
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

                    <#if num_columns == 2>
                        <#if (idx + 1) % 2 == 0>
                            <#assign css_class = "col-md-4 col-md-offset-2 col-sm-4 col-sm-offset-2" />
                        <#else>
                            <#assign css_class = "col-md-4 col-md-offset-1 col-sm-4 col-sm-offset-1" />
                        </#if>
                    </#if>
                
                    <div class="${css_class}">
                    
                        <#if cur_abstract.iconClass?? && cur_abstract.iconClass.getData()?has_content>
                            <div class="icon-wrapper">
                                <span class="icon ${cur_abstract.iconClass.getData()}"></span>
                            </div>
                        </#if>
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
        
        <#if link?? && link.getData()?has_content>
            <div class="row">
                <div class="common-link">
                
                    <#assign button_label = languageUtil.get(locale, "learn-more") />
                    
                    <#if label?? && label.getData()?has_content>
                        <#assign button_label = label.getData() />                        
                    </#if>

                    <a class="btn btn-lg btn-info" href="${link.getFriendlyUrl()}">
                        ${button_label}
                    </a>
                </div>
            </div>
        </#if>
    </div>
</div>
