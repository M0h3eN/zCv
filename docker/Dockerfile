FROM alpine:3.21.0 as base

# upgrade system
RUN apk upgrade --update && apk add --no-cache perl perl-lwp-protocol-https wget fontconfig

ENV	LANG=C.UTF-8 \
  LC_ALL=C.UTF-8

RUN mkdir /TeX
WORKDIR /TeX
COPY	docker/texlive.profile docker/tex-pkgs.txt /TeX/

# Install newest TeXLive
RUN	TAR="http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz" \
  && wget -nv $TAR && tar -xvf *.tar.gz \
  && mkdir texlive && cd texlive \
  && TEXLIVE_INSTALL_ENV_NOCHECK=true TEXLIVE_INSTALL_NO_WELCOME=true \
  ../install-tl-*/install-tl --profile=../texlive.profile && cd bin/* \
  # Install core packages
  && ./tlmgr install latex-bin luatex xetex latexmk latexdiff tools latex-fonts \
  # Install required packages only
  && ./tlmgr install $(cat /TeX/tex-pkgs.txt | tr "\n" " ") \
  # Clean up insallation
  && cd /TeX/ \
  && rm -rf install-tl-* textlive.profile tex-pkgs.txt \
  && rm -Rf /tmp/*

# Add custom classes
COPY classes texlive/texmf-local/tex/latex/local/
# Adding required fonts
COPY fonts /usr/share/fonts/

FROM alpine:3.21.0
RUN apk upgrade --update && apk add --no-cache perl fontconfig

COPY --from=base /TeX /TeX
# Adding required fonts
COPY fonts /usr/share/fonts/

ENV PATH="/TeX/texlive/bin/x86_64-linuxmusl/:${PATH}"

# Update fonts
RUN fc-cache -fv \ 
  # Update texmf-local
  && texhash --verbose \ 
  # Update filename database
  && mktexlsr \
  # Update all formats
  && fmtutil --sys --all \ 
  # Update font map database
  && updmap-sys \
  # Update/generate font names database
  && luaotfload-tool -u -f -v

WORKDIR /workdir
CMD ["/bin/bash"]
VOLUME ["/workdir"]

