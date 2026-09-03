---
title: "Internship"
layout: gridlay
sitemap: false
permalink: /internship/
---

<div class="timeline" markdown="0">
<h2 class="timeline-heading">Experience</h2>
{% for job in site.data.internships %}
<div class="timeline-item">
  <div class="timeline-date">
    <span>{{ job.start }}</span>
    <span class="timeline-date-sep">&mdash;</span>
    <span>{{ job.end }}</span>
  </div>
  <div class="timeline-marker"><span class="timeline-dot"></span></div>
  <div class="timeline-content">
    <h3 class="timeline-title">{{ job.title }}</h3>
    <p class="timeline-org">
      {{ job.company }}{% if job.team and job.team != "" %} &mdash; {{ job.team }}{% endif %}
      <span class="timeline-location">{{ job.location | upcase }}</span>
    </p>
    <p class="timeline-desc">
      Collaborator{% if job.mentors.size > 1 %}s{% endif %}:
      {% for m in job.mentors %}<a href="{{ m.url }}" target="_blank" rel="noopener noreferrer">{{ m.name }}</a>{% unless forloop.last %} &amp; {% endunless %}{% endfor %}
    </p>
  </div>
</div>
{% endfor %}
</div>
