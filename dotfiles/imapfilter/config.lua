options.create = true
options.subscribe = true

local perso = IMAP {
  server = "imap.gmail.com",
  username = "stephane.campinas@gmail.com",
  password = "rzltqiyylimkvwqk",
  ssl = "tls1"
}

all = perso.INBOX:select_all()

-- Rust
msgs = all:contain_from('twir@rust-lang.org') +
       all:contain_from('rust_lang@discoursemail.com') +
       all:contain_subject('Rust Language Tweeted') +
       all:contain_subject('dev-tools@rust-lang.org') +
       all:contain_cc('dev-tools@rust-lang.org')
msgs:move_messages(perso['rust'])

msgs = all:contain_to('rust@noreply.github.com')
msgs:move_messages(perso['rust/Github-core'])

msgs = all:contain_to('coreutils@noreply.github.com') +
       all:contain_to('alacritty@noreply.github.com') +
       all:contain_to('rustfmt@noreply.github.com') +
       all:contain_to('bat@noreply.github.com') +
       all:contain_to('i3status-rust@noreply.github.com')
msgs:move_messages(perso['rust/Github'])

-- German things
msgs = all:contain_from('kunde@tk.de') +
       all:contain_from('childcare@jugglehub.de') +
       all:contain_from('kita-pankis@googlegroups.com') +
       all:contain_from('service@green-zones.eu') +
       all:contain_from('Eingangsbestaetigung@tk.de')
msgs:move_messages(perso['Germany'])

-- France things
msgs = all:contain_from('gestion33@avis-immobilier.com') +
       all:contain_from('gestion33@nestenn.com') +
       all:contain_from('bienvenuechezmaaf@information.maaf.fr') +
       all:contain_from('service-clients@particuliers1.engie.com') +
       all:contain_from('service-clients@particuliers2.engie.com') +
       all:contain_from('ENGIE@particuliers.engie.com') +
       all:contain_from('Engie@particuliers7.engie.com') +
       all:contain_from('eau-en-ligne-BOM@service-client.toutsurmoneau.fr') +
       all:contain_from('leaubordeauxmetropole@contact.toutsurmoneau.fr') +
       all:contain_from('espace.clients@gazdebordeaux.fr') +
       all:contain_from('Service.client1@maaf.fr') +
       all:contain_from('service.client@maaf.fr') +
       all:contain_from('maaf@enquetes.bva.fr') +
       all:contain_from('christophe.beziade@hsbc.fr') +
       all:contain_from('gestion33@icloud.com') +
       all:contain_from('boutique-sfr@sfr.com') +
       all:contain_from('facture@service.sfr.fr') +
       all:contain_from('ne_pas_repondre@sfr.fr') +
       all:contain_from('relationclient@com-parc.sfr.fr') +
       all:contain_from('noreply@sosh.fr') +
       all:contain_from('apetipa@les-cherubins.com') +
       all:contain_from('s.simonin@avis-immobilier.com')
msgs:move_messages(perso['France'])

-- ML
msgs = all:contain_to('awesome@naquadah.org') +
       all:contain_to('awesome-copycats@noreply.github.com')
perso.INBOX:mark_seen(msgs)
msgs:move_messages(perso['ML/awesome'])

msgs = all:contain_to('arch-announce@lists.archlinux.org')
msgs:move_messages(perso['ML/archlinux'])

msgs = all:contain_to('lingual-user@googlegroups.com')
perso.INBOX:mark_seen(msgs)
msgs:move_messages(perso['Cascading/Lingual'])

msgs = all:contain_to('cascading-user@googlegroups.com') +
       all:contain_to('cascading@noreply.github.com')
perso.INBOX:mark_seen(msgs)
msgs:move_messages(perso['Cascading'])

msgs = all:contain_from('nytdirect@nytimes.com') +
       all:contain_from('newsletters@arstechnica.com') +
       all:contain_from('news@thelocal.de') +
       all:contain_from('newsletters@thelocal.com')
msgs:move_messages(perso['ML/News'])

msgs = all:contain_to('noreply@glassdoor.com') +
       all:contain_from('founders@dailycodingproblem.com') +
       all:contain_from('noreply@getpocket.com') +
       all:contain_from('team@today.getpocket.com') +
       all:contain_from('jobs-listings@linkedin.com') +
       all:contain_from('newsletter@sciencealert.com') +
       all:contain_from('medium.com') +
       all:contain_to('no-reply@arstechnica.com') +
       all:contain_to('noreply@getpocket.com') +
       all:contain_from('yo@dev.to') +
       all:contain_from('jess@dev.to') +
       all:contain_to('coders@codingame.com') +
       all:contain_to('no-reply@codingame.com') +
       all:contain_to('thibaud@codingame.com') +
       all:contain_to('firefox@email.mozilla.org') +
       all:contain_to('Mozilla@e.mozilla.org') +
       all:contain_from('info@dataengweekly.com')
msgs:move_messages(perso['ML/misc'])

-- Github
msgs = all:contain_to('uzbl-dev@lists.uzbl.org') +
       all:contain_to('uzbl@noreply.github.com')
msgs:move_messages(perso['Github/Uzbl'])

msgs = all:contain_to('neovim@googlegroups.com') +
       all:contain_to('neovim@noreply.github.com')
msgs:move_messages(perso['Github/neovim'])

msgs = all:contain_to('mozilla-dev-servo@lists.mozilla.org') +
       all:contain_to('dev-servo@lists.mozilla.org')
msgs:move_messages(perso['Github/Servo'])

msgs = all:contain_to('thrust@noreply.github.com') +
       all:contain_to('node-thrust@noreply.github.com')
msgs:move_messages(perso['Github/breach'])

msgs = all:contain_to('passman@noreply.github.com')
msgs:move_messages(perso['Github/passman'])

msgs = all:contain_to('jo@noreply.github.com')
msgs:move_messages(perso['Github/jo'])

msgs = all:contain_to('i3@noreply.github.com') +
       all:contain_to('i3-discuss@freelists.org')
msgs:move_messages(perso['Github/i3'])

msgs = all:contain_to('free-programming-books@noreply.github.com')
msgs:move_messages(perso['Github/Programming Books'])

msgs = all:contain_to('elasticsearch@noreply.github.com')
msgs:move_messages(perso['Github/Elasticsearch'])

msgs = all:contain_to('kibana@noreply.github.com')
msgs:move_messages(perso['Github/Kibana'])

msgs = all:contain_to('lucene@noreply.github.com')
msgs:move_messages(perso['Github/Lucene'])

msgs = all:contain_to('byzanz-window@noreply.github.com')
msgs:move_messages(perso['Github/byzanz-window'])

msgs = all:contain_to('termite@noreply.github.com')
msgs:move_messages(perso['Github/termite'])

-- Elastic
msgs = all:contain_to('elastic.co')
msgs:move_messages(perso['Elastic'])

msgs = all:contain_from('news@elastic.co') +
       all:contain_from('webevent@elastic.co') +
       all:contain_from('partners@elastic.co') +
       all:contain_from('elasticon@elastic.co') +
       all:contain_from('elk-update@elastic.co') +
       all:contain_from('elk-news@elastic.co') +
       all:contain_from('productupdate@elastic.co') +
       all:contain_from('productupdates@elastic.co') +
       all:contain_from('marketing_reply@elasticsearch.com') +
       all:contain_from('events@elastic.co') +
       all:contain_from('community@elastic.co')
msgs:move_messages(perso['Elastic/ML'])

-- Sindicetech
msgs = all:contain_from('vistra.com')
msgs:move_messages(perso['Sindicetech/Germany'])

msgs = all:match_to('.*@frkelly.com') +
       all:match_from('.*@frkelly.com')
msgs:move_messages(perso['Sindicetech/Patents'])

msgs = all:match_to('.*@dblue.it') +
       all:match_from('.*@dblue.it') +
       all:contain_subject('R2D2') +
       all:contain_subject('R2D3')
msgs:move_messages(perso['Sindicetech/R2D2'])

msgs = all:contain_from('server@siren.solutions')
perso.INBOX:mark_seen(msgs)
msgs:move_messages(perso['Sindicetech/Jenkins'])

msgs = all:contain_to('internal@sindicetech.com') +
       all:contain_to('internal@siren.solutions') +
       all:contain_to('internal@siren.io') +
       all:contain_to('developers@siren.io') +
       all:contain_to('everyone@siren.io')
msgs:move_messages(perso['Sindicetech'])

msgs = all:contain_from('stale[bot]')
msgs:delete_messages()

msgs = all:contain_to('knowledge-browser@noreply.github.com') +
       all:contain_to('POCs@noreply.github.com') +
       all:contain_to('sentinl@noreply.github.com') +
       all:contain_to('kibi-planning@noreply.github.com') +
       all:contain_to('kibi-internal@noreply.github.com') +
       all:contain_to('kibi-private@noreply.github.com') +
       all:contain_to('enhanced_tilemap@noreply.github.com') +
       all:contain_to('siren-join@noreply.github.com') +
       all:contain_to('kibi@noreply.github.com') +
       all:contain_to('kibi_timeline_vis@noreply.github.com') +
       all:contain_to('kibi_radar_chart_vis@noreply.github.com') +
       all:contain_to('kibi-distribution@noreply.github.com') +
       all:contain_to('kibiutils@noreply.github.com') +
       all:contain_to('license-manager@noreply.github.com') +
       all:contain_to('kibi-enterprise@noreply.github.com') +
       all:contain_to('kibi-integration@noreply.github.com') +
       all:contain_to('kibi-enterprise-vagrant@noreply.github.com') +
       all:contain_to('kibi_radar_vis@noreply.github.com') +
       all:contain_to('h2o2@noreply.github.com') +
       all:contain_to('federate_profiler_vis@noreply.github.com') +
       all:contain_to('unipop@noreply.github.com') +
       all:contain_to('kibi_wordcloud_vis@noreply.github.com') +
       all:contain_to('sirendb@noreply.github.com') +
       all:contain_to('kibi-download@noreply.github.com') +
       all:contain_to('sentinl-private@noreply.github.com') +
       all:contain_to('sysadm@noreply.github.com') +
       all:contain_to('gcloud-es-cluster@noreply.github.com') +
       all:contain_to('dremio-oss@noreply.github.com') +
       all:contain_to('demos@noreply.github.com') +
       all:contain_to('chem_search_vis@noreply.github.com') +
       all:contain_to('font-awesome-5@noreply.github.com') +
       all:contain_to('fontawesome-iconpicker@noreply.github.com') +
       all:contain_to('parallel-lines-chart@noreply.github.com') +
       all:contain_to('reason_vis@noreply.github.com') +
       all:contain_to('ingest@noreply.github.com') +
       all:contain_to('machine-learning@noreply.github.com') +
       all:contain_to('siren-alert@noreply.github.com') +
       all:contain_to('siren-ml@noreply.github.com') +
       all:contain_to('wordpress-theme@noreply.github.com') +
       all:contain_to('federate-tools@noreply.github.com') +
       all:contain_to('docs@noreply.github.com') +
       all:contain_to('scripting@noreply.github.com') +
       all:contain_to('federate-integration@noreply.github.com') +
       all:contain_to('web-service-interface@noreply.github.com') +
       all:contain_to('recon-ng-generator@noreply.github.com') +
       all:contain_to('web-service-manager@noreply.github.com') +
       all:contain_to('graph-browser@noreply.github.com') +
       all:contain_to('siren-web-services@noreply.github.com') +
       all:contain_to('siren-jira-plugin@noreply.github.com') +
       all:contain_to('scripting-interfaces@noreply.github.com') +
       all:contain_from('jira@sirensolutions.atlassian.net') +
       all:contain_to('siren-platform@noreply.github.com') +
       all:contain_to('gun-master@noreply.github.com')
msgs:move_messages(perso['Sindicetech/Github'])
msgs:delete_messages()

msgs = all:contain_to('mixedemotions@insight-centre.org') +
       all:contain_cc('mixedemotions@insight-centre.org') +
       all:contain_subject('[MixedEmotions]')
msgs:move_messages(perso['Sindicetech/MixedEmotions'])

msgs = all:contain_to('jira@sindicetech.atlassian.net') +
       all:contain_from('jira@sindicetech.atlassian.net')
msgs:move_messages(perso['Sindicetech/JIRA'])

msgs = all:contain_to('siren-user@sindicetech.com')
msgs:move_messages(perso['Sindicetech/SIREn'])

msgs = all:contain_to('sindicetech-freebase@googlegroups.com') +
       all:contain_to('KB-users@sindicetech.com') +
       all:contain_to('kibi-users@siren.solutions') +
       all:contain_to('kibi-users@siren.io')
msgs:move_messages(perso['Sindicetech/ML'])

-- Apache
msgs = all:contain_to('sesame-users@googlegroups.com')
perso.INBOX:mark_seen(msgs)
msgs:move_messages(perso['Apache/sesame'])

msgs = all:contain_to('general@lucene.apache.org')
msgs:move_messages(perso['Apache/lucene - general'])

msgs = all:contain_to('dev@lucene.apache.org')
msgs:move_messages(perso['Apache/lucene - dev'])

msgs = all:contain_to('dev@any23.apache.org')
perso.INBOX:mark_seen(msgs)
msgs:move_messages(perso['Apache/any23'])

msgs = all:contain_to('user@hbase.apache.org')
perso.INBOX:mark_seen(msgs)
msgs:move_messages(perso['Apache/hbase'])

msgs = all:contain_to('user@mahout.apache.org')
perso.INBOX:mark_seen(msgs)
msgs:move_messages(perso['Apache/mahout'])

msgs = all:contain_to('solr-user@lucene.apache.org')
perso.INBOX:mark_seen(msgs)
msgs:move_messages(perso['Apache/solr-user'])

msgs = all:contain_to('dev@calcite.apache.org')
msgs:move_messages(perso['Apache/calcite'])

-- W3C
msgs = all:contain_to('semantic-web@w3.org')
msgs:move_messages(perso['W3C/semantic-web'])

msgs = all:contain_to('public-lod@w3.org')
msgs:move_messages(perso['W3C/public-lod'])

msgs = all:contain_to('public-data-shapes-wg@w3.org')
perso.INBOX:mark_seen(msgs)
msgs:move_messages(perso['W3C/RDF Shapes'])

-- Perso
msgs = all:contain_to('ilabene@gmail.com') +
       all:contain_from('ilabene@gmail.com')
msgs:move_messages(perso['mum'])

msgs = all:contain_to('kasiaosuchowska@gmail.com') +
       all:contain_from('kasiaosuchowska@gmail.com')
msgs:move_messages(perso['kasia'])

msgs = all:contain_to('nuig@insight-centre.org') +
       all:contain_to('all@insight-centre.org') +
       all:contain_to('students-nuig@insight-centre.org') +
       all:contain_to('life-outside-insight@insight-centre.org')
msgs:move_messages(perso['NUIG'])

all:contain_subject('your subscription has expired as your recurring payment has failed'):delete_messages()
all:contain_to('users@javacc.java.net'):delete_messages()
