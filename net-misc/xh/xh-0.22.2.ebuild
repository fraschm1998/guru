# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.21.0
	adler@1.0.2
	aho-corasick@1.1.3
	alloc-no-stdlib@2.0.4
	alloc-stdlib@0.2.2
	anstream@0.6.13
	anstyle-parse@0.2.3
	anstyle-query@1.0.2
	anstyle-wincon@3.0.2
	anstyle@1.0.6
	anyhow@1.0.82
	assert_cmd@2.0.14
	autocfg@1.2.0
	backtrace@0.3.71
	base64@0.21.7
	base64@0.22.0
	bincode@1.3.3
	bitflags@1.3.2
	bitflags@2.5.0
	block-buffer@0.10.4
	brotli-decompressor@2.5.1
	brotli@3.5.0
	bstr@1.9.1
	bumpalo@3.16.0
	bytes@1.6.0
	cc@1.0.92
	cfg-if@1.0.0
	chardetng@0.1.17
	clap@4.5.4
	clap_builder@4.5.2
	clap_complete@4.5.2
	clap_derive@4.5.4
	clap_lex@0.7.0
	colorchoice@1.0.0
	console@0.15.8
	cookie@0.17.0
	cookie_store@0.20.0
	core-foundation-sys@0.8.6
	core-foundation@0.9.4
	cpufeatures@0.2.12
	crc32fast@1.4.0
	crypto-common@0.1.6
	deranged@0.3.11
	difflib@0.4.0
	digest@0.10.7
	digest_auth@0.3.1
	dirs-sys@0.4.1
	dirs@5.0.1
	doc-comment@0.3.3
	either@1.10.0
	encode_unicode@0.3.6
	encoding_rs@0.8.34
	encoding_rs_io@0.1.7
	equivalent@1.0.1
	errno@0.3.8
	fastrand@2.0.2
	flate2@1.0.28
	float-cmp@0.9.0
	fnv@1.0.7
	foreign-types-shared@0.1.1
	foreign-types@0.3.2
	form_urlencoded@1.2.1
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-io@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	generic-array@0.14.7
	getopts@0.2.21
	getrandom@0.2.14
	gimli@0.28.1
	h2@0.4.4
	hashbrown@0.12.3
	hashbrown@0.14.3
	heck@0.5.0
	hermit-abi@0.3.9
	hex@0.4.3
	http-body-util@0.1.1
	http-body@1.0.0
	http@1.1.0
	httparse@1.8.0
	httpdate@1.0.3
	hyper-rustls@0.26.0
	hyper-tls@0.6.0
	hyper-util@0.1.3
	hyper@1.2.0
	idna@0.3.0
	idna@0.5.0
	indexmap@1.9.3
	indexmap@2.2.6
	indicatif@0.17.8
	indoc@2.0.5
	instant@0.1.12
	ipnet@2.9.0
	itoa@1.0.11
	js-sys@0.3.69
	jsonxf@1.1.1
	lazy_static@1.4.0
	libc@0.2.153
	libredox@0.1.3
	line-wrap@0.2.0
	linked-hash-map@0.5.6
	linux-raw-sys@0.4.13
	log@0.4.21
	md-5@0.10.6
	memchr@2.7.2
	mime2ext@0.1.52
	mime@0.3.17
	mime_guess@2.0.4
	miniz_oxide@0.7.2
	mio@0.8.11
	native-tls@0.2.11
	network-interface@1.1.3
	normalize-line-endings@0.3.0
	num-conv@0.1.0
	num-traits@0.2.18
	num_cpus@1.16.0
	number_prefix@0.4.0
	object@0.32.2
	once_cell@1.19.0
	onig@6.4.0
	onig_sys@69.8.1
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-sys@0.9.102
	openssl@0.10.64
	option-ext@0.2.0
	os_display@0.1.3
	pem@3.0.4
	percent-encoding@2.3.1
	pin-project-internal@1.1.5
	pin-project-lite@0.2.14
	pin-project@1.1.5
	pin-utils@0.1.0
	pkg-config@0.3.30
	plist@1.6.1
	portable-atomic@1.6.0
	powerfmt@0.2.0
	ppv-lite86@0.2.17
	predicates-core@1.0.6
	predicates-tree@1.0.9
	predicates@3.1.0
	proc-macro2@1.0.79
	psl-types@2.0.11
	publicsuffix@2.2.3
	quick-xml@0.31.0
	quote@1.0.36
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	redox_users@0.4.5
	regex-automata@0.4.6
	regex-lite@0.1.5
	regex-syntax@0.8.3
	regex@1.10.4
	reqwest@0.12.3
	ring@0.17.8
	roff@0.2.1
	rpassword@7.3.1
	rtoolbox@0.0.2
	rustc-demangle@0.1.23
	rustix@0.38.32
	rustls-native-certs@0.7.0
	rustls-pemfile@2.1.2
	rustls-pki-types@1.4.1
	rustls-webpki@0.102.2
	rustls@0.22.3
	ryu@1.0.17
	same-file@1.0.6
	schannel@0.1.23
	security-framework-sys@2.10.0
	security-framework@2.10.0
	serde-transcode@1.1.1
	serde@1.0.197
	serde_derive@1.0.197
	serde_json@1.0.115
	serde_urlencoded@0.7.1
	sha2@0.10.8
	slab@0.4.9
	smallvec@1.13.2
	socket2@0.5.6
	spin@0.9.8
	strsim@0.11.1
	subtle@2.5.0
	syn@2.0.58
	sync_wrapper@0.1.2
	syntect@5.2.0
	system-configuration-sys@0.5.0
	system-configuration@0.5.1
	tempfile@3.10.1
	termcolor@1.4.1
	terminal_size@0.3.0
	termtree@0.4.1
	thiserror-impl@1.0.58
	thiserror@1.0.58
	time-core@0.1.2
	time-macros@0.2.18
	time@0.3.36
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tokio-native-tls@0.3.1
	tokio-rustls@0.25.0
	tokio-socks@0.5.1
	tokio-util@0.7.10
	tokio@1.37.0
	tower-layer@0.3.2
	tower-service@0.3.2
	tower@0.4.13
	tracing-core@0.1.32
	tracing@0.1.40
	try-lock@0.2.5
	typenum@1.17.0
	unicase@2.7.0
	unicode-bidi@0.3.15
	unicode-ident@1.0.12
	unicode-normalization@0.1.23
	unicode-width@0.1.11
	untrusted@0.9.0
	url@2.5.0
	utf8parse@0.2.1
	vcpkg@0.2.15
	version_check@0.9.4
	wait-timeout@0.2.0
	walkdir@2.5.0
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.92
	wasm-bindgen-futures@0.4.42
	wasm-bindgen-macro-support@0.2.92
	wasm-bindgen-macro@0.2.92
	wasm-bindgen-shared@0.2.92
	wasm-bindgen@0.2.92
	web-sys@0.3.69
	webpki-roots@0.26.1
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.48.5
	windows-targets@0.52.5
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.5
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.5
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.5
	windows_i686_gnullvm@0.52.5
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.5
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.5
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.5
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.5
	winreg@0.52.0
	yaml-rust@0.4.5
	zeroize@1.7.0
"

inherit cargo shell-completion

DESCRIPTION="Friendly and fast tool for sending HTTP requests"
HOMEPAGE="https://github.com/ducaale/xh"
SRC_URI="
	https://github.com/ducaale/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD ISC MIT MPL-2.0 Unicode-DFS-2016"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

DEPEND="
	dev-libs/oniguruma:=
	dev-libs/openssl:0=
"
RDEPEND="${DEPEND}"

DOCS=( {CHANGELOG,README}.md )

QA_FLAGS_IGNORED="usr/bin/${PN}"

src_configure() {
	# high magic to allow system-libs
	export OPENSSL_NO_VENDOR=true
	export RUSTONIG_SYSTEM_LIBONIG=1

	myfeatures=(
		native-tls
	)

	cargo_src_configure --no-default-features
}

src_install() {
	cargo_src_install

	# See https://github.com/ducaale/xh#making-https-requests-by-default
	dosym "${PN}" "/usr/bin/${PN}s"

	einstalldocs
	doman "doc/${PN}.1"

	newbashcomp "completions/${PN}.bash" "${PN}"
	dozshcomp "completions/_${PN}"
	dofishcomp "completions/${PN}.fish"
}
