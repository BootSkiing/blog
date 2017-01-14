[[ -f include/bm.conf.example ]] && \
	source include/bm.conf.example
[[ -f include/bm.conf ]] && \
	source include/bm.conf

# Set defaults in case something was still unset
#
# Parts of this code are only going to be executed if bm.conf.example was messed
# with or removed. It shouldn't have been, as per the big warning at the top
# of it.

[[ "${BLOG_SUBTITLE}" == "" ]] && \
	BLOG_SUBTITLE="Where super awesome things happen"
[[ "${BLOG_TITLE}" == "" ]] && \
	BLOG_TITLE="My Super Awesome Blog"
[[ "${CREATE_HELP_VERBOSITY}" == "" ]] && \
	CREATE_HELP_VERBOSITY="long"
[[ "${DATE_FRMT}" == "" ]] && \
	DATE_FRMT="%d %b %Y"
[[ "${DEFAULT_AUTHOR}" == "" ]] && \
	DEFAULT_AUTHOR="$(whoami)"
[[ "${DEFAULT_INDEX_BY}" == "" ]] && \
	DEFAULT_INDEX_BY="none"
[[ "${ED}" == "" ]] && \
	ED="${EDITOR}"
[[ "${LONG_DATE_FRMT}" == "" ]] && \
	LONG_DATE_FRMT="%d %b %Y at %l:%M %P"
[[ "${MAKE_SHORT_POSTS}" == "" ]] && \
	MAKE_SHORT_POSTS="yes"
[[ "${MONTHLY_INDEX_DATE_FRMT}" == "" ]] && \
	MONTHLY_INDEX_DATE_FRMT="%b %Y"
[[ "${MULTI_MATCH_STRAT}" == "" ]] && \
	MULTI_MATCH_STRAT="simple"
[[ "${POST_INDEX_BY}" == "" ]] && \
	POST_INDEX_BY="${DEFAULT_INDEX_BY}"
[[ "${POSTS_ON_HOMEPAGE}" == "" ]] && \
	POSTS_ON_HOMEPAGE="5"
[[ "${PREFER_SHORT_POSTS}" == "" ]] && \
	PREFER_SHORT_POSTS="no"
[[ "${PREVIEW_MAX_WORDS}" == "" ]] && \
	PREVIEW_MAX_WORDS="300"
[[ "${REBUILD_POLICY}" == "" ]] && \
	REBUILD_POLICY="asap"
[[ "${ROOT_URL}" == "" ]] && \
	ROOT_URL=""
[[ "${SIGNIFICANT_MOD_AFTER}" == "" ]] && \
	SIGNIFICANT_MOD_AFTER="1" || \
	SIGNIFICANT_MOD_AFTER="$((${SIGNIFICANT_MOD_AFTER}))"
[[ "${TAG_INDEX_BY}" == "" ]] && \
	TAG_INDEX_BY="${DEFAULT_INDEX_BY}"
[[ "${YEARLY_INDEX_DATE_FRMT}" == "" ]] && \
	YEARLY_INDEX_DATE_FRMT="%Y"

# Error checking
#
# This should always end up being executed. There are certain combinations of
# options that can be created that are invalid.

[[ "${PREFER_SHORT_POSTS}" == "yes" ]] && \
[[ "${MAKE_SHORT_POSTS}" != "yes" ]] && \
	echo "error: PREFER_SHORT_POSTS requires MAKE_SHORT_POSTS" && \
	exit 1