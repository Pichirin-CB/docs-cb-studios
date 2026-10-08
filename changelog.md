
<div class="changelog-page">

  <section class="changelog-hero">
    <div class="changelog-hero-content">
      <span class="changelog-kicker">CB Studios release notes</span>
      <h1>CB Survival Extract — Changelog</h1>
      <p class="changelog-lead">
        Explore the development history, releases, improvements,
        compatibility updates, and important changes introduced
        to CB Survival Extract since January 2026.
      </p>
    </div>

    <div class="changelog-hero-panel">
      <span class="changelog-badge changelog-badge-latest">
        Latest documented version
      </span>
      <strong class="changelog-hero-version">v1.1.1</strong>
      <span class="changelog-date">July 11, 2026</span>
    </div>
  </section>

  <section class="changelog-meta-grid" aria-label="Changelog summary">
    <div class="changelog-meta">
      <span class="changelog-meta-label">Development started</span>
      <strong class="changelog-meta-value">January 2026</strong>
    </div>

    <div class="changelog-meta">
      <span class="changelog-meta-label">Documented versions</span>
      <strong class="changelog-meta-value">2</strong>
    </div>

    <div class="changelog-meta">
      <span class="changelog-meta-label">Resource</span>
      <strong class="changelog-meta-value">cb-survivalextract</strong>
    </div>
  </section>

  <section class="changelog-version-index" aria-label="Version index">
    <div class="changelog-section-heading">
      <span class="changelog-section-eyebrow">Release history</span>
      <h2 class="changelog-section-title">Development timeline</h2>
    </div>

    <a class="changelog-version-link" href="#/changelog?id=version-111">
      <span class="changelog-version-link-main">v1.1.1</span>
      <span class="changelog-version-link-detail">
        CB Survival Extract · July 11, 2026
      </span>
    </a>

    <a class="changelog-version-link" href="#/changelog?id=version-110">
      <span class="changelog-version-link-main">v1.1.0</span>
      <span class="changelog-version-link-detail">
        CB Survival Extract · March 12, 2026
      </span>
    </a>

    <a class="changelog-version-link" href="#/changelog?id=development-start">
      <span class="changelog-version-link-main">Project Started</span>
      <span class="changelog-version-link-detail">
        CB Survival Extract · January 2026
      </span>
    </a>
  </section>

  <!-- VERSION 1.1.1 -->

  <article id="version-111" class="changelog-card">
    <div class="changelog-card-header">
      <div>
        <span class="changelog-badge">Compatibility Update</span>
        <h2 class="changelog-card-title">v1.1.1</h2>
      </div>
      <time class="changelog-date" datetime="2026-07-11">
        July 11, 2026
      </time>
    </div>

    <div class="changelog-resource">
      <span class="changelog-resource-label">Updated resource</span>
      <a class="changelog-resource-link" href="#/scripts/apocalypse-extraction">
        cb-survivalextract
      </a>
    </div>

    <p class="changelog-summary">
      This update expands inventory compatibility, resolves helicopter
      model configuration issues, and improves the overall stability
      and customization of the extraction system.
    </p>

    <div class="changelog-grid">
      <section class="changelog-section">
        <span class="changelog-section-icon">✨</span>
        <h3 class="changelog-section-name">Highlights</h3>
        <ul class="changelog-list">
          <li>Added support for <code>ashenlabs_inventory</code>.</li>
          <li>Fixed extraction helicopter model configuration.</li>
          <li>Improved compatibility across supported server setups.</li>
        </ul>
      </section>

      <section class="changelog-section">
        <span class="changelog-section-icon">📦</span>
        <h3 class="changelog-section-name">Inventory Compatibility</h3>
        <ul class="changelog-list">
          <li>Integrated <code>ashenlabs_inventory</code> support.</li>
          <li>Expanded inventory integration options.</li>
        </ul>
      </section>

      <section class="changelog-section">
        <span class="changelog-section-icon">🚁</span>
        <h3 class="changelog-section-name">Helicopter Improvements</h3>
        <ul class="changelog-list">
          <li>Fixed custom extraction helicopter model selection.</li>
          <li>Improved helicopter configuration handling.</li>
          <li>Supported helicopter models can be selected through configuration.</li>
        </ul>
      </section>

      <section class="changelog-section">
        <span class="changelog-section-icon">⚡</span>
        <h3 class="changelog-section-name">General Improvements</h3>
        <ul class="changelog-list">
          <li>Improved system stability.</li>
          <li>Enhanced customization options.</li>
          <li>Improved compatibility with different server environments.</li>
        </ul>
      </section>
    </div>

    <div class="changelog-actions">
      <a class="changelog-button" href="#/changelog/1.1.1">
        View full release notes
      </a>
    </div>
  </article>

  <!-- VERSION 1.1.0 -->

  <article id="version-110" class="changelog-card">
    <div class="changelog-card-header">
      <div>
        <span class="changelog-badge">System Update</span>
        <h2 class="changelog-card-title">v1.1.0</h2>
      </div>
      <time class="changelog-date" datetime="2026-03-12">
        March 12, 2026
      </time>
    </div>

    <div class="changelog-resource">
      <span class="changelog-resource-label">Updated resource</span>
      <a class="changelog-resource-link" href="#/scripts/apocalypse-extraction">
        cb-survivalextract
      </a>
    </div>

    <p class="changelog-summary">
      This release introduces a more independent resource architecture,
      removes the hate-bridge dependency, and expands integration
      capabilities for inventories and notification systems.
    </p>

    <div class="changelog-grid">
      <section class="changelog-section">
        <span class="changelog-section-icon">🔄</span>
        <h3 class="changelog-section-name">Architecture</h3>
        <ul class="changelog-list">
          <li>Removed the <code>hate-bridge</code> dependency.</li>
          <li>Improved resource independence.</li>
          <li>Simplified installation and configuration.</li>
        </ul>
      </section>

      <section class="changelog-section">
        <span class="changelog-section-icon">📦</span>
        <h3 class="changelog-section-name">Inventory Integrations</h3>
        <ul class="changelog-list">
          <li>Added support for <code>qs_inventory</code>.</li>
          <li>Added support for <code>core_inventory</code>.</li>
          <li>Added support for <code>tgiann-inventory</code>.</li>
        </ul>
      </section>

      <section class="changelog-section">
        <span class="changelog-section-icon">⚙️</span>
        <h3 class="changelog-section-name">Customization</h3>
        <ul class="changelog-list">
          <li>Introduced integration hooks in <code>custom.lua</code>.</li>
          <li>Improved modularity for future development.</li>
          <li>Made external integrations easier to customize.</li>
        </ul>
      </section>

      <section class="changelog-section changelog-warning">
        <span class="changelog-section-icon">⚠️</span>
        <h3 class="changelog-section-name">Important Changes</h3>
        <ul class="changelog-list">
          <li>Existing installations relying on <code>hate-bridge</code> may require configuration changes.</li>
          <li>Review custom integrations when updating from older versions.</li>
        </ul>
      </section>
    </div>

    <div class="changelog-actions">
      <a class="changelog-button" href="#/changelog/1.1.0">
        View full release notes
      </a>
    </div>
  </article>

  <!-- DEVELOPMENT START -->

  <article id="development-start" class="changelog-card">
    <div class="changelog-card-header">
      <div>
        <span class="changelog-badge">Project Milestone</span>
        <h2 class="changelog-card-title">Development Started</h2>
      </div>
      <time class="changelog-date" datetime="2026-01">
        January 2026
      </time>
    </div>

    <div class="changelog-resource">
      <span class="changelog-resource-label">Project</span>
      <a class="changelog-resource-link" href="#/scripts/apocalypse-extraction">
        CB Survival Extract
      </a>
    </div>

    <p class="changelog-summary">
      Development of the extraction system began in January 2026,
      marking the beginning of the CB Survival Extract project
      by CB Studios.
    </p>

    <div class="changelog-grid">
      <section class="changelog-section">
        <span class="changelog-section-icon">🚀</span>
        <h3 class="changelog-section-name">Project Beginning</h3>
        <ul class="changelog-list">
          <li>Initial development began in January 2026.</li>
          <li>Established the project as a survival extraction resource for FiveM.</li>
        </ul>
      </section>

      <section class="changelog-section">
        <span class="changelog-section-icon">🎯</span>
        <h3 class="changelog-section-name">Project Vision</h3>
        <ul class="changelog-list">
          <li>Build an extraction experience for survival-oriented servers.</li>
          <li>Provide a configurable foundation for future extraction features.</li>
          <li>Support continued development and integration improvements.</li>
        </ul>
      </section>
    </div>
  </article>

</div>

