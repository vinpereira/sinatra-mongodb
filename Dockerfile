FROM ruby:2.4.1-onbuild

EXPOSE 4567

CMD ["puma"]