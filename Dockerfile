FROM ubuntu:16.04
ARG current_user

RUN apt update && apt upgrade -y

RUN apt install -y wget texlive texlive-latex-extra texlive-fonts-recommended texlive-fonts-extra sudo

# Create workspace for installer files
WORKDIR /installer

RUN wget https://github.com/jgm/pandoc/releases/download/2.9.1.1/pandoc-2.9.1.1-1-amd64.deb && sudo dpkg -i pandoc-2.9.1.1-1-amd64.deb
# -p to create the intermediate if not exists
RUN mkdir -p /root/.pandoc/templates/
# Download template
RUN wget https://github.com/Wandmalfarbe/pandoc-latex-template/releases/download/v1.3.1/Eisvogel-1.3.1.zip && unzip -d Eisvogel Eisvogel-1.3.1.zip
RUN cp Eisvogel/eisvogel.tex /root/.pandoc/templates/eisvogel.latex

WORKDIR /report-generator

COPY report.sh /report-generator/report.sh

RUN chmod +x report.sh

ENTRYPOINT [ "./report.sh"]

# Allow for user provided arguments
CMD []