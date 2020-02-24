<%
    //tag::map[]
    def nav = [
        title: 'DukeCon',
        entries: [
          'Conferences': 'conferences',
          'Developers': [
                  'Clients': 'clients',
                  'Links': 'links',
                  'Test-Reports': 'testreports/htmlsanity'
          ],
          'Architecture': [
                  '1. Introduction and Goals': 'architecture/01_introduction_and_goals',
                  '2. Architecture Constraints': 'architecture/02_architecture_constraints',
                  '3. System Scope and Context': 'architecture/03_system_scope_and_context',
                  '4. Solution Strategy': 'architecture/04_solution_strategy',
                  '5. Building Block View': 'architecture/05_building_block_view',
                  '6. Runtime View': 'architecture/06_runtime_view',
                  '7. Deployment View': 'architecture/07_deployment_view',
                  '8. Concepts': 'architecture/08_concepts',
                  '9. Design Decisions': 'architecture/09_design_decisions',
                  '10. Quality Scenarios': 'architecture/10_quality_scenarios',
                  '11. Technical Risks': 'architecture/11_technical_risks',
                  '12. Glossary': 'architecture/12_glossary',
          ],
          'Imprint (DE)': 'impressum',
        ]
    ]
    //end::map[]
%>
	<!-- Fixed navbar -->
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="<%if (content.rootpath) {%>${content.rootpath}<% } else { %><% }%>index.html">${nav.title}</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
              <% nav.entries.each { key, value -> %>
                <% if (value.class == String.class) { %>
                  <li><a href="<%if (content.rootpath) {%>${content.rootpath}<% } else { %><% }%>${value}${(value.endsWith('/') || value.startsWith('http'))?'':'.html'}">${key}</a></li>
                <% } else { %>
                  <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">${key}<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                      <% value.each { it -> %>
                        <li><a href="<%if (content.rootpath) {%>${content.rootpath}<% } else { %><% }%>${it.value}${(it.value.endsWith('/') || it.value.startsWith('http'))?'':'.html'}">${it.key}</a></li>
                      <% } %>
                    </ul>
                  </li>
                <% } %>
              <% } %>
          </ul>
            <!-- tag::search[] -->
            <form class="navbar-form navbar-right" action="https://google.de/search">
                <div class="form-group">
                    <input type="hidden" name="q" value="site:dukecon.org">
                    <input type="text" name="q" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
            <!-- end::search[] -->
        </div><!--/.nav-collapse -->
      </div>
    </div>
