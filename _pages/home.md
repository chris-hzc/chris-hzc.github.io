---
title: "Home"
layout: homelay
sitemap: false
permalink: /
---

<div id="about"></div>

<h2 markdown="0">About Me</h2>

<div style="text-align: justify;" markdown="1">

I am currently a Ph.D. student in Computer Science at <a href="https://www.ncsu.edu/">North Carolina State University</a>, where I am fortunate to be advised by <a href="https://sites.google.com/ncsu.edu/xiaorui/">Prof. Xiaorui Liu</a>. Prior to that, I received my M.S. degree in Mathematics from the <a href="http://www.amss.ac.cn/">Chinese Academy of Sciences</a>, and my B.S. degree in Mathematics from <a href="http://math.bnu.edu.cn/">Beijing Normal University</a>.
I have gained diverse industry research experience at <a href="https://trustworthyshopping.aboutamazon.com/">Trustworthy Shopping at Amazon</a> (2026), <a href="https://www.amazon.science/research-areas/automated-reasoning">Automated Reasoning at AWS AI</a> (2025), <a href="https://aws.amazon.com/guardduty/">Amazon GuardDuty</a> (2024), <a href="https://ir.baidu.com/">Baidu, Inc.</a> (2023), and <a href="https://air.tsinghua.edu.cn/">Tsinghua AIR</a> (2022).

My research focuses on building <strong>scalable trustworthy AI systems</strong> that stay reliable across dynamic environments while remaining efficient to train, deploy, and store, which can be divided into three pieces:

</div>

<div class="interest-list" markdown="0">

<ol class="interest-level-list">
<li>
<details class="interest-accordion">
<summary><span class="accordion-arrow">&#9654;</span> Architecture Level <span class="level-keywords">— Robustness-Informed Neural Networks (RINNs) Framework</span></summary>
<p>Grounded in the theoretical foundations of robust statistics and non-convex optimization, I propose <strong>robustness-informed neural networks (RINNs)</strong>, a principled framework applicable across diverse architectures and domains. I instantiate RINNs for transformers via robust attention <a class="ref-tag" href="https://arxiv.org/abs/2410.23182" target="_blank" rel="noopener noreferrer">[ProTransformer, NeurIPS'24]</a>, for graph neural networks via unbiased robust aggregation <a class="ref-tag" href="https://arxiv.org/abs/2311.14934v2" target="_blank" rel="noopener noreferrer">[RUNG, NeurIPS'24]</a>, and for convolutional networks via robust dictionary structure <a class="ref-tag" href="https://arxiv.org/abs/2502.00834" target="_blank" rel="noopener noreferrer">[EDLNets]</a>.</p>
</details>
</li>
<li>
<details class="interest-accordion">
<summary><span class="accordion-arrow">&#9654;</span> Deployment Level <span class="level-keywords">— Training Acceleration &middot; Resource Limit &middot; Dynamic Risk</span></summary>
<p>Real-world deployment is constrained by limited training budgets, heterogeneous compute, and ever-changing environments, raising three practical questions I pursue:</p>
<ol>
<li><strong>How to accelerate robust training?</strong> I cut the cost of robust training by removing redundancy across iterative attack/defense steps, matching standard adversarial training's robustness with only 30% of the training budget <a class="ref-tag" href="https://arxiv.org/abs/2510.26981" target="_blank" rel="noopener noreferrer">[Spiking Attacks, ICLR'26]</a>.</li>
<li><strong>How to robustify models with limited resource?</strong> I enable resource-adaptive robustification of pretrained models through training-free integration <a class="ref-tag" href="https://arxiv.org/abs/2410.23182" target="_blank" rel="noopener noreferrer">[ProTransformer, NeurIPS'24]</a> and versatile robustness reprogramming across paradigms spanning training-free adaptation to full fine-tuning <a class="ref-tag" href="https://arxiv.org/abs/2410.04577" target="_blank" rel="noopener noreferrer">[Robustness Reprogramming, ICLR'25]</a>.</li>
<li><strong>How can a single model handle dynamic environments?</strong> I train one all-in-one model conditioned on risk type, so new risks are met with a lightweight adapter rather than retraining the backbone <span class="ref-tag">[CAN]</span>.</li>
</ol>
</details>
</li>
<li>
<details class="interest-accordion">
<summary><span class="accordion-arrow">&#9654;</span> Computing Level <span class="level-keywords">— Algorithmic Acceleration &middot; Kernel Efficiency &middot; Precision Reduction</span></summary>
<p>I systematically cut computational overhead across all three levels:</p>
<ol>
<li><strong>Algorithm-wise:</strong> I eliminate redundant operations across iterative trustworthy-AI procedures, accelerating iterative attacks and adversarial training <a class="ref-tag" href="https://arxiv.org/abs/2510.26981" target="_blank" rel="noopener noreferrer">[Spiking Attacks, ICLR'26]</a>, randomized smoothing <a class="ref-tag" href="https://arxiv.org/abs/2411.00899" target="_blank" rel="noopener noreferrer">[SRS, NeurIPS'24]</a>, and memory-enhanced graph learning <a class="ref-tag" href="#publications">[IncAgg-GNN, NeurIPS'26]</a>.</li>
<li><strong>Kernel-wise:</strong> I design hardware-aware GPU kernels that minimize memory traffic, fusing robust reweighting into IO-aware attention kernels to safeguard LLM agents in real time <span class="ref-tag">[ProFlashAttention]</span>.</li>
<li><strong>Precision-wise:</strong> I compute with fewer bits by quantizing the small, stabilizing updates in iterative procedures rather than full activations, as in accelerated generative modeling <a class="ref-tag" href="https://arxiv.org/abs/2506.22463" target="_blank" rel="noopener noreferrer">[ModDiff, ICML'25]</a>, extending to quantized iterative attacks and adversarial training.</li>
</ol>
</details>
</li>
</ol>

</div>

---

<div id="news"></div>

<h2 markdown="0">News</h2>

<div class="section-card" markdown="0">
<div class="news-timeline">
{% for article in site.data.news limit:5 %}
<div class="news-item">
<span class="news-date">{{ article.date }}</span>
<span class="news-headline">{{ article.headline }}</span>
</div>
{% endfor %}
</div>
{% assign remaining = site.data.news | size | minus: 5 %}
{% if remaining > 0 %}
<div class="news-collapse" id="newsCollapse">
<div class="news-timeline">
{% for article in site.data.news offset:5 %}
<div class="news-item">
<span class="news-date">{{ article.date }}</span>
<span class="news-headline">{{ article.headline }}</span>
</div>
{% endfor %}
</div>
</div>
<button class="btn-pill btn-abstract" id="newsToggle" style="margin-top: var(--space-4);" data-more="Show {{ remaining }} more &#9662;" data-less="Show less &#9652;">Show {{ remaining }} more &#9662;</button>
{% endif %}
</div>

<script>
(function () {
  var btn = document.getElementById('newsToggle');
  var panel = document.getElementById('newsCollapse');
  if (!btn || !panel) return;
  btn.addEventListener('click', function () {
    var expanded = panel.classList.toggle('show');
    btn.innerHTML = expanded ? btn.getAttribute('data-less') : btn.getAttribute('data-more');
  });
})();
</script>

---

<div id="publications"></div>

<div class="pub-header" markdown="0">
  <div style="display: flex; align-items: center; gap: var(--space-3); flex-wrap: wrap;">
    <h2 style="margin: 0;">Selected Publications</h2>
    <a href="{{ site.url }}{{ site.baseurl }}/publications" class="badge badge-link">Full Publications &rarr;</a>
  </div>
</div>

<div id="pubListing" markdown="0">
{% assign featuredPubs = site.data.publications | where: "featured", true | sort: "feature_rank" %}
{% for pub in featuredPubs %}
<div class="pub-card">
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
  </p>
</div>
{% endfor %}
</div>

---

<div id="internship"></div>

<div class="timeline" markdown="0">
<h2 class="timeline-heading">Internship Experience</h2>
{% for job in site.data.internships %}
<div class="timeline-item">
  <div class="timeline-date">
    <span>{{ job.start }}</span>
    <span class="timeline-date-sep">&mdash;</span>
    <span>{{ job.end }}</span>
  </div>
  <div class="timeline-marker"><span class="timeline-dot"></span></div>
  <div class="timeline-content">
    <div class="timeline-row">
      <h3 class="timeline-title">{{ job.title }}</h3>
      <span class="timeline-company">{{ job.company }}</span>
    </div>
    <p class="timeline-org">
      {% if job.team and job.team != "" %}{{ job.team }}{% endif %}
      <span class="timeline-location">{{ job.location | upcase }}</span>
    </p>
    <p class="timeline-desc">
      Collaborator{% if job.mentors.size > 1 %}s{% endif %}:
      {% for m in job.mentors %}<a href="{{ m.url }}" target="_blank" rel="noopener noreferrer">{{ m.name }}</a>{% unless forloop.last %}, {% endunless %}{% endfor %}
    </p>
    {% if job.focus %}
    <p class="timeline-focus">
      {{ job.focus }}{% if job.outcomes %} &#8594; {% for o in job.outcomes %}{% if o.url %}<a href="{{ o.url }}" target="_blank" rel="noopener noreferrer">{{ o.label }} <span class="timeline-link-icon">&#8599;</span></a>{% else %}{{ o.label }}{% endif %}{% unless forloop.last %}, {% endunless %}{% endfor %}.{% endif %}
    </p>
    {% endif %}
  </div>
</div>
{% endfor %}
</div>

---

<div id="ball-is-life"></div>

<h2 markdown="0">Ball Is Life <img src="{{ site.url }}{{ site.baseurl }}/images/basketball.png" alt="🏀" class="ball-icon"></h2>

<p class="ball-motto" markdown="0">Brotherhood is why we play.</p>

<div class="ball-gallery" markdown="0">
<div class="ball-row">
<div class="ball-row-images">
<img src="{{ site.url }}{{ site.baseurl }}/images/team1.jpg" alt="Basketball team" loading="lazy">
<img src="{{ site.url }}{{ site.baseurl }}/images/champion1.jpg" alt="Championship celebration" loading="lazy">
</div>
<p class="ball-caption">&#127942; Champion I</p>
</div>
<div class="ball-row">
<div class="ball-row-images">
<img src="{{ site.url }}{{ site.baseurl }}/images/team2.jpg" alt="Basketball team" loading="lazy">
<img src="{{ site.url }}{{ site.baseurl }}/images/champion2.jpg" alt="Championship celebration" loading="lazy">
</div>
<p class="ball-caption">&#127942; Champion II</p>
</div>
</div>
