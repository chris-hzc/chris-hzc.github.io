---
title: "Publications"
layout: gridlay
sitemap: false
permalink: /publications/
---

<div class="pub-header" markdown="0">
  <h2>Publications</h2>
  <p class="pub-subtitle">Peer-reviewed papers and preprints. Filter by year or topic.</p>
</div>

<div class="pub-filters" id="pubFilters" markdown="0">
  <div class="pub-filter-row">
    <span class="pub-filter-label">ALL</span>
    <button class="pub-pill pub-pill-everything active" data-filter="all">Everything</button>
    <button class="pub-pill" data-filter="first-author">First Author</button>
  </div>
  <div class="pub-filter-row">
    <span class="pub-filter-label">YEAR</span>
    <button class="pub-pill" data-filter="year" data-value="2026">2026</button>
    <button class="pub-pill" data-filter="year" data-value="2025">2025</button>
    <button class="pub-pill" data-filter="year" data-value="2024">2024</button>
    <button class="pub-pill" data-filter="year" data-value="2023">2023</button>
  </div>
  <div class="pub-filter-row">
    <span class="pub-filter-label">TOPIC</span>
    <button class="pub-pill" data-filter="topic" data-value="trustworthy-ai">trustworthy-ai</button>
    <button class="pub-pill" data-filter="topic" data-value="efficient-ai">efficient-ai</button>
    <button class="pub-pill" data-filter="topic" data-value="ai-for-science">ai-for-science</button>
    <button class="pub-pill" data-filter="topic" data-value="graph-learning">graph-learning</button>
    <button class="pub-pill" data-filter="topic" data-value="adversarial-robustness">adversarial-robustness</button>
    <button class="pub-pill" data-filter="topic" data-value="generative-models">generative-models</button>
    <button class="pub-pill" data-filter="topic" data-value="transformers">transformers</button>
    <button class="pub-pill" data-filter="topic" data-value="llm">llm</button>
    <button class="pub-pill" data-filter="topic" data-value="bioinformatics">bioinformatics</button>
  </div>
</div>

<div id="pubListing" markdown="0">
{% assign grouped = site.data.publications | group_by: "year" | sort: "name" | reverse %}
{% for group in grouped %}
<h3 class="pub-year-heading" data-year-heading="{{ group.name }}">{{ group.name }}</h3>
<div class="pub-year-group" data-year-group="{{ group.name }}">
{% for pub in group.items %}
<div class="pub-card" data-year="{{ pub.year }}" data-tags="{{ pub.tags | join: ',' }}" data-first-author="{{ pub.first_author | default: false }}">
  <div class="pub-badges">
    <span class="badge badge-venue">{{ pub.venue_short }}{% unless pub.preprint %} {{ pub.year }}{% endunless %}</span>
    {% if pub.award %}<span class="badge badge-award">&#127942; {{ pub.award }}</span>{% endif %}
    {% for link in pub.links %}<a href="{{ link.url }}" target="_blank" rel="noopener noreferrer" class="badge badge-link">{{ link.label }} &#8599;</a>{% endfor %}
  </div>
  <h4 class="pub-card-title">{{ pub.title }}</h4>
  <p class="pub-card-authors">
    {% for a in pub.authors %}{% if a contains "Zhichao Hou" %}<strong>{{ a }}</strong>{% else %}{{ a }}{% endif %}{% unless forloop.last %}, {% endunless %}{% endfor %}
  </p>
  <p class="pub-card-meta">
    {% if pub.stat %}{{ pub.stat }} &middot; {% endif %}{{ pub.venue }}{% if pub.note %} &middot; {{ pub.note }}{% endif %}
    {% for t in pub.tags %}<span class="pub-tag">#{{ t }}</span>{% endfor %}
  </p>
</div>
{% endfor %}
</div>
{% endfor %}
</div>

<script>
(function () {
  var filtersEl = document.getElementById('pubFilters');
  if (!filtersEl) return;

  var everythingBtn = filtersEl.querySelector('[data-filter="all"]');
  var firstAuthorBtn = filtersEl.querySelector('[data-filter="first-author"]');
  var yearBtns = filtersEl.querySelectorAll('[data-filter="year"]');
  var topicBtns = filtersEl.querySelectorAll('[data-filter="topic"]');
  var cards = document.querySelectorAll('.pub-card');
  var yearGroups = document.querySelectorAll('.pub-year-group');
  var yearHeadings = document.querySelectorAll('.pub-year-heading');

  var activeYear = null;
  var activeTopics = new Set();
  var firstAuthorOnly = false;

  function updateEverythingState() {
    var isEmpty = !activeYear && activeTopics.size === 0 && !firstAuthorOnly;
    everythingBtn.classList.toggle('active', isEmpty);
  }

  function applyFilters() {
    cards.forEach(function (card) {
      var yearMatch = !activeYear || card.getAttribute('data-year') === activeYear;
      var tags = (card.getAttribute('data-tags') || '').split(',');
      var topicMatch = activeTopics.size === 0 || Array.from(activeTopics).some(function (t) {
        return tags.indexOf(t) !== -1;
      });
      var firstAuthorMatch = !firstAuthorOnly || card.getAttribute('data-first-author') === 'true';
      card.style.display = (yearMatch && topicMatch && firstAuthorMatch) ? '' : 'none';
    });

    yearGroups.forEach(function (group) {
      var visible = Array.from(group.querySelectorAll('.pub-card')).some(function (c) {
        return c.style.display !== 'none';
      });
      group.style.display = visible ? '' : 'none';
    });

    yearHeadings.forEach(function (heading) {
      var year = heading.getAttribute('data-year-heading');
      var group = document.querySelector('.pub-year-group[data-year-group="' + year + '"]');
      heading.style.display = (group && group.style.display !== 'none') ? '' : 'none';
    });

    updateEverythingState();
  }

  everythingBtn.addEventListener('click', function () {
    activeYear = null;
    activeTopics.clear();
    firstAuthorOnly = false;
    yearBtns.forEach(function (b) { b.classList.remove('active'); });
    topicBtns.forEach(function (b) { b.classList.remove('active'); });
    firstAuthorBtn.classList.remove('active');
    applyFilters();
  });

  firstAuthorBtn.addEventListener('click', function () {
    firstAuthorOnly = !firstAuthorOnly;
    firstAuthorBtn.classList.toggle('active', firstAuthorOnly);
    applyFilters();
  });

  yearBtns.forEach(function (btn) {
    btn.addEventListener('click', function () {
      var value = btn.getAttribute('data-value');
      if (activeYear === value) {
        activeYear = null;
        btn.classList.remove('active');
      } else {
        activeYear = value;
        yearBtns.forEach(function (b) { b.classList.remove('active'); });
        btn.classList.add('active');
      }
      applyFilters();
    });
  });

  topicBtns.forEach(function (btn) {
    btn.addEventListener('click', function () {
      var value = btn.getAttribute('data-value');
      if (activeTopics.has(value)) {
        activeTopics.delete(value);
        btn.classList.remove('active');
      } else {
        activeTopics.add(value);
        btn.classList.add('active');
      }
      applyFilters();
    });
  });

  applyFilters();
})();
</script>
