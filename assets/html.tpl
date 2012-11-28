<h1><%= title %></h1>

<p><strong>Source: <%= file %></strong></p>

<p><a href="<%= indexFile %>">Back to Index</a></p>

<%
for (var i = 0; i < body.length; i++) {
	var node = body[i];
	var comment = node['comment'];
	var tags = comment['tags'];
%>
<h3><%= node['function'] %></h3>
<div><%= marked.parse(comment['text']) %></div>

<ul>
<%
for (var j = 0; j < tags.length; j++) {
	var tag = tags[j];
%>
<li><%= tag['tag'] %> <% if (tag['type']) { %>{<%= tag['type'] %>} <% } %><%= tag['value'] %> <%= tag['description'] %></li>
<% } %>
</ul>
<a class="toggle" href="#" data-target="source-<%= i %>">Show source</a>

<div id='source-<%= i %>' data-state="close" class='hidden'>
<pre class="pre-scrollable"><%= node['source'] %></pre>
</div>
<% } %>