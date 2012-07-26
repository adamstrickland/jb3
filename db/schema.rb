# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 0) do

  create_table "__sequences", :id => false, :force => true do |t|
    t.string  "name",  :limit => 128, :default => "", :null => false
    t.integer "value",                :default => 0,  :null => false
  end

  create_table "admin_log", :id => false, :force => true do |t|
    t.integer  "user_id",                :null => false
    t.datetime "time",                   :null => false
    t.string   "action",  :limit => 250, :null => false
  end

  add_index "admin_log", ["action"], :name => "i_admin_log_a"
  add_index "admin_log", ["time"], :name => "i_admin_log_t"
  add_index "admin_log", ["user_id"], :name => "i_admin_log_uid"

  create_table "answer", :force => true do |t|
    t.integer "question_id",                :null => false
    t.string  "name",        :limit => nil
    t.boolean "correct"
  end

  add_index "answer", ["question_id"], :name => "i_answer_question_id"

  create_table "app_message", :force => true do |t|
    t.string "key",   :limit => 512, :null => false
    t.text   "value"
  end

  add_index "app_message", ["key"], :name => "fk_app_message_key"
  add_index "app_message", ["key"], :name => "u_app_message_key", :unique => true

  create_table "candidate_file", :id => false, :force => true do |t|
    t.integer "id",                           :null => false
    t.integer "candidate_id",                 :null => false
    t.integer "type",                         :null => false
    t.string  "name",         :limit => 256,  :null => false
    t.string  "content_type", :limit => 32,   :null => false
    t.string  "path",         :limit => 1024, :null => false
    t.integer "size",         :limit => 8,    :null => false
  end

  add_index "candidate_file", ["candidate_id"], :name => "i_candidate_file_candidate_id"
  add_index "candidate_file", ["content_type"], :name => "i_candidate_file_content_type"
  add_index "candidate_file", ["name"], :name => "i_candidate_file_name"
  add_index "candidate_file", ["path"], :name => "i_candidate_file_path"
  add_index "candidate_file", ["size"], :name => "i_candidate_file_size"
  add_index "candidate_file", ["type"], :name => "i_candidate_file_type"

  create_table "candidate_files_group", :id => false, :force => true do |t|
    t.integer "id",                                :null => false
    t.string  "name",               :limit => 256, :null => false
    t.string  "content_types",      :limit => 512, :null => false
    t.string  "content_types_text", :limit => 256, :null => false
    t.integer "size",                              :null => false
  end

  add_index "candidate_files_group", ["content_types"], :name => "i_candidate_files_group_content_types"
  add_index "candidate_files_group", ["content_types_text"], :name => "i_candidate_files_group_content_types_text"
  add_index "candidate_files_group", ["name"], :name => "i_candidate_files_group_name"
  add_index "candidate_files_group", ["size"], :name => "i_candidate_files_group_size"

  create_table "category_series", :force => true do |t|
    t.integer "chart_id",                     :null => false
    t.string  "category",      :limit => 254, :null => false
    t.integer "category_type",                :null => false
    t.string  "label",         :limit => 254, :null => false
    t.integer "label_type",                   :null => false
    t.string  "series",        :limit => 254, :null => false
    t.integer "series_type",                  :null => false
    t.string  "value",         :limit => 254, :null => false
    t.integer "value_type",                   :null => false
  end

  add_index "category_series", ["category"], :name => "i_category_series_category"
  add_index "category_series", ["category_type"], :name => "i_category_series_category_type"
  add_index "category_series", ["chart_id"], :name => "i_category_series_chart_id"
  add_index "category_series", ["label"], :name => "i_category_series_label"
  add_index "category_series", ["label_type"], :name => "i_category_series_label_type"
  add_index "category_series", ["series"], :name => "i_category_series_series"
  add_index "category_series", ["series_type"], :name => "i_category_series_series_type"
  add_index "category_series", ["value"], :name => "i_category_series_value"
  add_index "category_series", ["value_type"], :name => "i_category_series_value_type"

  create_table "class_dependencies", :id => false, :force => true do |t|
    t.integer "class_id",           :default => 0, :null => false
    t.integer "submissed_class_id", :default => 0, :null => false
  end

  add_index "class_dependencies", ["class_id", "submissed_class_id"], :name => "class_dependencies_class_id_key", :unique => true

  create_table "class_fields", :id => false, :force => true do |t|
    t.integer "id",                       :default => 0,  :null => false
    t.integer "class_id",                 :default => 0,  :null => false
    t.string  "name",      :limit => 128, :default => "", :null => false
    t.string  "shortname", :limit => 64,  :default => "", :null => false
    t.integer "type_id",                  :default => 0,  :null => false
    t.boolean "required",                                 :null => false
    t.boolean "shown",                                    :null => false
  end

  add_index "class_fields", ["class_id", "shortname"], :name => "class_fields_class_id_key", :unique => true

  create_table "classes", :id => false, :force => true do |t|
    t.integer "id",                               :default => 0,     :null => false
    t.string  "name",              :limit => 128, :default => "",    :null => false
    t.string  "shortname",         :limit => 64,  :default => "",    :null => false
    t.string  "default_template",  :limit => 128
    t.boolean "showatadmintree",                  :default => false, :null => false
    t.string  "default_admin_url", :limit => 128,                    :null => false
    t.boolean "subnodes_n_edit",                  :default => false, :null => false
    t.integer "default_help_id"
    t.boolean "defaultconfirm",                                      :null => false
  end

  add_index "classes", ["shortname"], :name => "classes_shortname_key", :unique => true
  add_index "classes", ["showatadmintree"], :name => "i_classes_showatadmintree"

  create_table "coupon", :force => true do |t|
    t.string   "code",          :limit => nil, :null => false
    t.datetime "date_created"
    t.datetime "date_updated"
    t.datetime "date_expired"
    t.boolean  "active",                       :null => false
    t.datetime "activate_date"
    t.integer  "user_type_id",                 :null => false
    t.boolean  "paid"
    t.boolean  "multi"
  end

  add_index "coupon", ["activate_date"], :name => "i_coupon_ad"
  add_index "coupon", ["active"], :name => "i_coupon_a"
  add_index "coupon", ["code"], :name => "i_coupon_code"
  add_index "coupon", ["date_created"], :name => "i_coupon_dc"
  add_index "coupon", ["date_expired"], :name => "i_coupon_de"
  add_index "coupon", ["date_updated"], :name => "i_coupon_du"
  add_index "coupon", ["multi"], :name => "i_coupon_m"
  add_index "coupon", ["paid"], :name => "i_coupon_p"

  create_table "coupon_history", :id => false, :force => true do |t|
    t.integer "owner_id",       :null => false
    t.integer "item_id",        :null => false
    t.integer "entity_type_id", :null => false
  end

  add_index "coupon_history", ["item_id"], :name => "i_coupon_history_it"

  create_table "coupon_package", :force => true do |t|
    t.integer "coupon_id",  :null => false
    t.integer "package_id", :null => false
    t.integer "quantity",   :null => false
    t.integer "region_id",  :null => false
  end

  add_index "coupon_package", ["coupon_id"], :name => "fki_coupon_id"
  add_index "coupon_package", ["package_id"], :name => "fki_package_id"
  add_index "coupon_package", ["region_id"], :name => "fki_coupon_package_region_id"

  create_table "csv_dictionary_possible_matching", :id => false, :force => true do |t|
    t.integer "owner_id", :null => false
    t.integer "item_id",  :null => false
  end

  create_table "csv_upload", :force => true do |t|
    t.string  "name",              :limit => 256
    t.integer "entity_id"
    t.integer "separator_id"
    t.string  "other_separator",   :limit => 256
    t.integer "text_delimiter_id"
    t.string  "charset",           :limit => 16
  end

  add_index "csv_upload", ["entity_id"], :name => "i_csv_upload_entity_id"
  add_index "csv_upload", ["name"], :name => "i_csv_upload_name"
  add_index "csv_upload", ["other_separator"], :name => "i_csv_upload_other_separator"
  add_index "csv_upload", ["separator_id"], :name => "i_csv_upload_separator_id"
  add_index "csv_upload", ["text_delimiter_id"], :name => "i_csv_upload_text_delimiter_id"

  create_table "csv_upload_column", :force => true do |t|
    t.integer "owner_id"
    t.integer "entity_id"
    t.integer "field_id"
    t.string  "name",          :limit => 256
    t.integer "number"
    t.integer "type_id"
    t.boolean "identity"
    t.text    "default_value"
    t.text    "common1"
  end

  add_index "csv_upload_column", ["common1"], :name => "i_csv_upload_column_common1"
  add_index "csv_upload_column", ["default_value"], :name => "i_csv_upload_column_default_value"
  add_index "csv_upload_column", ["entity_id"], :name => "i_csv_upload_column_entity_id"
  add_index "csv_upload_column", ["field_id"], :name => "i_csv_upload_column_field_id"
  add_index "csv_upload_column", ["identity"], :name => "i_csv_upload_column_identity"
  add_index "csv_upload_column", ["name"], :name => "i_csv_upload_column_name"
  add_index "csv_upload_column", ["number"], :name => "i_csv_upload_column_number"
  add_index "csv_upload_column", ["owner_id"], :name => "i_csv_upload_column_owner_id"
  add_index "csv_upload_column", ["type_id"], :name => "i_csv_upload_column_type_id"

  create_table "csv_upload_column_dictionary_matching", :force => true do |t|
    t.integer "owner_id"
    t.string  "name",     :limit => 256
    t.integer "item_id"
  end

  add_index "csv_upload_column_dictionary_matching", ["item_id"], :name => "i_csv_upload_column_dictionary_matching_item_id"
  add_index "csv_upload_column_dictionary_matching", ["name"], :name => "i_csv_upload_column_dictionary_matching_name"
  add_index "csv_upload_column_dictionary_matching", ["owner_id"], :name => "i_csv_upload_column_dictionary_matching_owner_id"

  create_table "dash_report_parameter", :id => false, :force => true do |t|
    t.integer "rgp_id",                         :null => false
    t.integer "parameter_id",                   :null => false
    t.string  "parameter_value", :limit => 254
    t.string  "parameter_name",  :limit => 254
    t.integer "jdbc_type",                      :null => false
    t.integer "parameter_type",                 :null => false
  end

  create_table "dictionary_item", :force => true do |t|
    t.integer  "type_id"
    t.string   "name",       :limit => 256
    t.integer  "owner_id"
    t.integer  "sort_order"
    t.boolean  "show"
    t.string   "shortname",  :limit => 256
    t.integer  "shift"
    t.string   "parents",    :limit => nil
    t.tsvector "tsv_name"
    t.boolean  "optgroup",                  :default => false
  end

  add_index "dictionary_item", ["name"], :name => "i_dictionary_item_name"
  add_index "dictionary_item", ["optgroup"], :name => "i_di_optg"
  add_index "dictionary_item", ["owner_id"], :name => "i_dictionary_item_owner_id"
  add_index "dictionary_item", ["shift"], :name => "i_dictionary_item_shift"
  add_index "dictionary_item", ["shortname"], :name => "i_dictionary_item_shortname"
  add_index "dictionary_item", ["show"], :name => "i_dictionary_item_show"
  add_index "dictionary_item", ["sort_order"], :name => "i_dictionary_item_sort_order"
  add_index "dictionary_item", ["tsv_name"], :name => "i_dictionary_item_tsv_name"
  add_index "dictionary_item", ["type_id", "shortname"], :name => "uk_type_id_shortname", :unique => true
  add_index "dictionary_item", ["type_id"], :name => "i_dictionary_item_type_id"

  create_table "dictionary_item_child", :id => false, :force => true do |t|
    t.integer "owner_id", :null => false
    t.integer "item_id",  :null => false
  end

  create_table "dictionary_item_link", :id => false, :force => true do |t|
    t.integer "owner_id", :null => false
    t.integer "item_id",  :null => false
  end

  create_table "dictionary_type", :force => true do |t|
    t.string  "name",     :limit => 256
    t.integer "child_id"
  end

  add_index "dictionary_type", ["child_id"], :name => "i_dictionary_type_child_id"
  add_index "dictionary_type", ["name"], :name => "i_dictionary_type_name"

  create_table "dynamic_candidate", :force => true do |t|
    t.string   "col72",     :limit => 256
    t.string   "col73",     :limit => 256
    t.string   "col74",     :limit => 256
    t.string   "col75",     :limit => 256
    t.integer  "col76"
    t.datetime "col78"
    t.datetime "col79"
    t.datetime "col80"
    t.boolean  "col95"
    t.text     "col374"
    t.tsvector "tsv_col72"
    t.tsvector "tsv_col74"
    t.tsvector "tsv_col75"
    t.string   "col377",    :limit => 256
    t.string   "col382",    :limit => 256
    t.string   "col383",    :limit => 256
    t.string   "col449",    :limit => 256
    t.datetime "col450"
    t.integer  "col451"
    t.string   "col452",    :limit => 256
    t.text     "col455"
    t.string   "col464",    :limit => 256
    t.string   "col482",    :limit => 256
    t.boolean  "col748"
    t.boolean  "col750"
    t.string   "col751",    :limit => 256
    t.string   "col752",    :limit => 256
  end

  add_index "dynamic_candidate", ["col374"], :name => "i_dynamic_candidate_col374"
  add_index "dynamic_candidate", ["col377"], :name => "i_dynamic_candidate_col377"
  add_index "dynamic_candidate", ["col382"], :name => "i_dynamic_candidate_col382"
  add_index "dynamic_candidate", ["col383"], :name => "i_dynamic_candidate_col383"
  add_index "dynamic_candidate", ["col449"], :name => "i_dynamic_candidate_col449"
  add_index "dynamic_candidate", ["col450"], :name => "i_dynamic_candidate_col450"
  add_index "dynamic_candidate", ["col451"], :name => "i_dynamic_candidate_col451"
  add_index "dynamic_candidate", ["col452"], :name => "i_dynamic_candidate_col452"
  add_index "dynamic_candidate", ["col464"], :name => "i_dynamic_candidate_col464"
  add_index "dynamic_candidate", ["col482"], :name => "i_dynamic_candidate_col482"
  add_index "dynamic_candidate", ["col72"], :name => "u_dynamic_candidate_col72", :unique => true
  add_index "dynamic_candidate", ["col73"], :name => "i_dynamic_candidate_col73"
  add_index "dynamic_candidate", ["col74"], :name => "i_dynamic_candidate_col74"
  add_index "dynamic_candidate", ["col748"], :name => "i_dynamic_candidate_col748"
  add_index "dynamic_candidate", ["col75"], :name => "i_dynamic_candidate_col75"
  add_index "dynamic_candidate", ["col750"], :name => "i_dynamic_candidate_col750"
  add_index "dynamic_candidate", ["col751"], :name => "i_dynamic_candidate_col751"
  add_index "dynamic_candidate", ["col752"], :name => "i_dynamic_candidate_col752"
  add_index "dynamic_candidate", ["col76"], :name => "i_dynamic_candidate_col76"
  add_index "dynamic_candidate", ["col78"], :name => "i_dynamic_candidate_col78"
  add_index "dynamic_candidate", ["col79"], :name => "i_dynamic_candidate_col79"
  add_index "dynamic_candidate", ["col80"], :name => "i_dynamic_candidate_col80"
  add_index "dynamic_candidate", ["col95"], :name => "i_dynamic_candidate_col95"
  add_index "dynamic_candidate", ["tsv_col72"], :name => "i_dynamic_candidate_tsv_col72"
  add_index "dynamic_candidate", ["tsv_col74"], :name => "i_dynamic_candidate_tsv_col74"
  add_index "dynamic_candidate", ["tsv_col75"], :name => "i_dynamic_candidate_tsv_col75"

  create_table "dynamic_candidate_dictionary_335", :id => false, :force => true do |t|
    t.integer "owner_id", :null => false
    t.integer "item_id",  :null => false
  end

  add_index "dynamic_candidate_dictionary_335", ["item_id"], :name => "i_dynamic_candidate_dictionary_335_item_id"
  add_index "dynamic_candidate_dictionary_335", ["owner_id"], :name => "i_dynamic_candidate_dictionary_335_owner_id"

  create_table "dynamic_candidate_file_481", :force => true do |t|
    t.integer "owner_id"
    t.string  "name",         :limit => 256
    t.integer "size",         :limit => 8
    t.string  "content_type", :limit => 256
    t.text    "text_content"
    t.string  "path",         :limit => 1024
  end

  add_index "dynamic_candidate_file_481", ["content_type"], :name => "i_dynamic_candidate_file_481_content_type"
  add_index "dynamic_candidate_file_481", ["id"], :name => "i_dynamic_candidate_file_481_id"
  add_index "dynamic_candidate_file_481", ["name"], :name => "i_dynamic_candidate_file_481_name"
  add_index "dynamic_candidate_file_481", ["owner_id"], :name => "i_dynamic_candidate_file_481_owner_id"
  add_index "dynamic_candidate_file_481", ["path"], :name => "i_dynamic_candidate_file_481_path"
  add_index "dynamic_candidate_file_481", ["size"], :name => "i_dynamic_candidate_file_481_size"

  create_table "dynamic_candidate_search_agent", :force => true do |t|
    t.integer "owner_id"
    t.text    "col29"
    t.integer "col63"
    t.text    "col215"
    t.integer "col279"
  end

  add_index "dynamic_candidate_search_agent", ["col215"], :name => "i_dynamic_candidate_search_agent_col215"
  add_index "dynamic_candidate_search_agent", ["col279"], :name => "i_dynamic_candidate_search_agent_col279"
  add_index "dynamic_candidate_search_agent", ["col29"], :name => "i_dynamic_candidate_search_agent_col29"
  add_index "dynamic_candidate_search_agent", ["col63"], :name => "i_dynamic_candidate_search_agent_col63"
  add_index "dynamic_candidate_search_agent", ["owner_id"], :name => "i_dynamic_candidate_search_agent_owner_id"

  create_table "dynamic_candidate_search_agent_dictionary_213", :id => false, :force => true do |t|
    t.integer "owner_id", :null => false
    t.integer "item_id",  :null => false
  end

  add_index "dynamic_candidate_search_agent_dictionary_213", ["item_id"], :name => "i_dynamic_candidate_search_agent_dictionary_213_item_id"
  add_index "dynamic_candidate_search_agent_dictionary_213", ["owner_id"], :name => "i_dynamic_candidate_search_agent_dictionary_213_owner_id"

  create_table "dynamic_candidate_search_agent_dictionary_216", :id => false, :force => true do |t|
    t.integer "owner_id", :null => false
    t.integer "item_id",  :null => false
  end

  add_index "dynamic_candidate_search_agent_dictionary_216", ["item_id"], :name => "i_dynamic_candidate_search_agent_dictionary_216_item_id"
  add_index "dynamic_candidate_search_agent_dictionary_216", ["owner_id"], :name => "i_dynamic_candidate_search_agent_dictionary_216_owner_id"

  create_table "dynamic_candidate_search_agent_dictionary_284", :id => false, :force => true do |t|
    t.integer "owner_id", :null => false
    t.integer "item_id",  :null => false
  end

  add_index "dynamic_candidate_search_agent_dictionary_284", ["item_id"], :name => "i_dynamic_candidate_search_agent_dictionary_284_item_id"
  add_index "dynamic_candidate_search_agent_dictionary_284", ["owner_id"], :name => "i_dynamic_candidate_search_agent_dictionary_284_owner_id"

  create_table "dynamic_employer", :force => true do |t|
    t.string   "col120",     :limit => 256
    t.string   "col121",     :limit => 256
    t.string   "col122",     :limit => 256
    t.datetime "col126"
    t.datetime "col127"
    t.datetime "col128"
    t.integer  "col129"
    t.boolean  "col130"
    t.string   "col194",     :limit => 256
    t.text     "col213"
    t.string   "col318",     :limit => 256
    t.boolean  "col336"
    t.text     "col340"
    t.tsvector "tsv_col122"
    t.tsvector "tsv_col120"
    t.tsvector "tsv_col213"
    t.tsvector "tsv_col318"
    t.string   "col379",     :limit => 256
    t.string   "col384",     :limit => 256
    t.string   "col385",     :limit => 256
    t.string   "col388",     :limit => 256
    t.string   "col389",     :limit => 256
    t.string   "col390",     :limit => 256
    t.string   "col391",     :limit => 256
    t.string   "col392",     :limit => 256
    t.string   "col393",     :limit => 256
    t.string   "col394",     :limit => 256
    t.text     "col395"
    t.text     "col396"
    t.text     "col397"
    t.string   "col398",     :limit => 256
    t.string   "col399",     :limit => 256
    t.text     "col400"
    t.string   "col401",     :limit => 256
    t.string   "col403",     :limit => 256
    t.string   "col404",     :limit => 256
    t.text     "col405"
    t.text     "col406"
    t.string   "col407",     :limit => 256
    t.string   "col408",     :limit => 256
    t.string   "col409",     :limit => 256
    t.string   "col410",     :limit => 256
    t.string   "col411",     :limit => 256
    t.string   "col412",     :limit => 256
    t.string   "col413",     :limit => 256
    t.string   "col415",     :limit => 256
    t.string   "col416",     :limit => 256
    t.string   "col426",     :limit => 256
    t.string   "col427",     :limit => 256
    t.string   "col428",     :limit => 256
    t.string   "col429",     :limit => 256
    t.string   "col432",     :limit => 256
    t.string   "col438",     :limit => 256
    t.string   "col439",     :limit => 256
    t.string   "col440",     :limit => 256
    t.text     "col441"
    t.text     "col442"
    t.string   "col443",     :limit => 256
    t.text     "col444"
    t.text     "col445"
    t.boolean  "col462"
    t.integer  "col478"
    t.boolean  "col479"
    t.integer  "col480"
    t.boolean  "col486"
    t.text     "col513"
    t.boolean  "col514"
    t.integer  "col550"
    t.string   "col551",     :limit => 256
    t.datetime "col552"
    t.string   "col553",     :limit => 256
    t.string   "col554",     :limit => 256
    t.text     "col555"
    t.string   "col649",     :limit => 256
    t.string   "col651",     :limit => 256
    t.string   "col652",     :limit => 256
    t.string   "col653",     :limit => 256
    t.datetime "col654"
    t.text     "col655"
    t.string   "col676",     :limit => 256
    t.integer  "col677"
    t.string   "col701",     :limit => 256
    t.boolean  "col747"
    t.boolean  "col749"
    t.boolean  "col753"
  end

  add_index "dynamic_employer", ["col120"], :name => "ui_dyn_emp_login", :unique => true
  add_index "dynamic_employer", ["col121"], :name => "i_dynamic_employer_col121"
  add_index "dynamic_employer", ["col122"], :name => "i_dynamic_employer_col122"
  add_index "dynamic_employer", ["col126"], :name => "i_dynamic_employer_col126"
  add_index "dynamic_employer", ["col127"], :name => "i_dynamic_employer_col127"
  add_index "dynamic_employer", ["col128"], :name => "i_dynamic_employer_col128"
  add_index "dynamic_employer", ["col129"], :name => "i_dynamic_employer_col129"
  add_index "dynamic_employer", ["col130"], :name => "i_dynamic_employer_col130"
  add_index "dynamic_employer", ["col194"], :name => "i_dynamic_employer_col194"
  add_index "dynamic_employer", ["col318"], :name => "i_dynamic_employer_col318"
  add_index "dynamic_employer", ["col336"], :name => "i_dynamic_employer_col336"
  add_index "dynamic_employer", ["col379"], :name => "i_dynamic_employer_col379"
  add_index "dynamic_employer", ["col384"], :name => "i_dynamic_employer_col384"
  add_index "dynamic_employer", ["col385"], :name => "i_dynamic_employer_col385"
  add_index "dynamic_employer", ["col388"], :name => "i_dynamic_employer_col388"
  add_index "dynamic_employer", ["col389"], :name => "i_dynamic_employer_col389"
  add_index "dynamic_employer", ["col390"], :name => "i_dynamic_employer_col390"
  add_index "dynamic_employer", ["col391"], :name => "i_dynamic_employer_col391"
  add_index "dynamic_employer", ["col392"], :name => "i_dynamic_employer_col392"
  add_index "dynamic_employer", ["col393"], :name => "i_dynamic_employer_col393"
  add_index "dynamic_employer", ["col394"], :name => "i_dynamic_employer_col394"
  add_index "dynamic_employer", ["col398"], :name => "i_dynamic_employer_col398"
  add_index "dynamic_employer", ["col399"], :name => "i_dynamic_employer_col399"
  add_index "dynamic_employer", ["col401"], :name => "i_dynamic_employer_col401"
  add_index "dynamic_employer", ["col403"], :name => "i_dynamic_employer_col403"
  add_index "dynamic_employer", ["col404"], :name => "i_dynamic_employer_col404"
  add_index "dynamic_employer", ["col407"], :name => "i_dynamic_employer_col407"
  add_index "dynamic_employer", ["col408"], :name => "i_dynamic_employer_col408"
  add_index "dynamic_employer", ["col409"], :name => "i_dynamic_employer_col409"
  add_index "dynamic_employer", ["col410"], :name => "i_dynamic_employer_col410"
  add_index "dynamic_employer", ["col411"], :name => "i_dynamic_employer_col411"
  add_index "dynamic_employer", ["col412"], :name => "i_dynamic_employer_col412"
  add_index "dynamic_employer", ["col413"], :name => "i_dynamic_employer_col413"
  add_index "dynamic_employer", ["col415"], :name => "i_dynamic_employer_col415"
  add_index "dynamic_employer", ["col416"], :name => "i_dynamic_employer_col416"
  add_index "dynamic_employer", ["col426"], :name => "i_dynamic_employer_col426"
  add_index "dynamic_employer", ["col427"], :name => "i_dynamic_employer_col427"
  add_index "dynamic_employer", ["col428"], :name => "i_dynamic_employer_col428"
  add_index "dynamic_employer", ["col429"], :name => "i_dynamic_employer_col429"
  add_index "dynamic_employer", ["col432"], :name => "i_dynamic_employer_col432"
  add_index "dynamic_employer", ["col438"], :name => "i_dynamic_employer_col438"
  add_index "dynamic_employer", ["col439"], :name => "i_dynamic_employer_col439"
  add_index "dynamic_employer", ["col440"], :name => "i_dynamic_employer_col440"
  add_index "dynamic_employer", ["col443"], :name => "i_dynamic_employer_col443"
  add_index "dynamic_employer", ["col462"], :name => "i_dynamic_employer_col462"
  add_index "dynamic_employer", ["col478"], :name => "i_dynamic_employer_col478"
  add_index "dynamic_employer", ["col479"], :name => "i_dynamic_employer_col479"
  add_index "dynamic_employer", ["col480"], :name => "i_dynamic_employer_col480"
  add_index "dynamic_employer", ["col486"], :name => "i_dynamic_employer_col486"
  add_index "dynamic_employer", ["col514"], :name => "i_dynamic_employer_col514"
  add_index "dynamic_employer", ["col550"], :name => "i_dynamic_employer_col550"
  add_index "dynamic_employer", ["col551"], :name => "i_dynamic_employer_col551"
  add_index "dynamic_employer", ["col552"], :name => "i_dynamic_employer_col552"
  add_index "dynamic_employer", ["col553"], :name => "i_dynamic_employer_col553"
  add_index "dynamic_employer", ["col554"], :name => "i_dynamic_employer_col554"
  add_index "dynamic_employer", ["col649"], :name => "i_dynamic_employer_col649"
  add_index "dynamic_employer", ["col651"], :name => "i_dynamic_employer_col651"
  add_index "dynamic_employer", ["col652"], :name => "i_dynamic_employer_col652"
  add_index "dynamic_employer", ["col653"], :name => "i_dynamic_employer_col653"
  add_index "dynamic_employer", ["col654"], :name => "i_dynamic_employer_col654"
  add_index "dynamic_employer", ["col676"], :name => "i_dynamic_employer_col676"
  add_index "dynamic_employer", ["col677"], :name => "i_dynamic_employer_col677"
  add_index "dynamic_employer", ["col701"], :name => "i_dynamic_employer_col701"
  add_index "dynamic_employer", ["col747"], :name => "i_dynamic_employer_col747"
  add_index "dynamic_employer", ["col749"], :name => "i_dynamic_employer_col749"
  add_index "dynamic_employer", ["col753"], :name => "i_dynamic_employer_col753"
  add_index "dynamic_employer", ["tsv_col120"], :name => "i_dynamic_employer_tsv_col120"
  add_index "dynamic_employer", ["tsv_col122"], :name => "i_dynamic_employer_tsv_col122"
  add_index "dynamic_employer", ["tsv_col213"], :name => "i_dynamic_employer_tsv_col213"
  add_index "dynamic_employer", ["tsv_col318"], :name => "i_dynamic_employer_tsv_col318"

  create_table "dynamic_employer_dictionary_324", :id => false, :force => true do |t|
    t.integer "owner_id", :null => false
    t.integer "item_id",  :null => false
  end

  add_index "dynamic_employer_dictionary_324", ["item_id"], :name => "i_dynamic_employer_dictionary_324_item_id"
  add_index "dynamic_employer_dictionary_324", ["owner_id"], :name => "i_dynamic_employer_dictionary_324_owner_id"

  create_table "dynamic_employer_dictionary_511", :id => false, :force => true do |t|
    t.integer "owner_id", :null => false
    t.integer "item_id",  :null => false
  end

  add_index "dynamic_employer_dictionary_511", ["item_id"], :name => "i_dynamic_employer_dictionary_759_item_id"
  add_index "dynamic_employer_dictionary_511", ["owner_id"], :name => "i_dynamic_employer_dictionary_759_owner_id"

  create_table "dynamic_employer_file_430", :force => true do |t|
    t.integer "owner_id"
    t.string  "name",         :limit => 256
    t.integer "size",         :limit => 8
    t.string  "content_type", :limit => 256
    t.text    "text_content"
    t.string  "path",         :limit => 1024
  end

  add_index "dynamic_employer_file_430", ["content_type"], :name => "i_dynamic_employer_file_430_content_type"
  add_index "dynamic_employer_file_430", ["id"], :name => "i_dynamic_employer_file_430_id"
  add_index "dynamic_employer_file_430", ["name"], :name => "i_dynamic_employer_file_430_name"
  add_index "dynamic_employer_file_430", ["owner_id"], :name => "i_dynamic_employer_file_430_owner_id"
  add_index "dynamic_employer_file_430", ["path"], :name => "i_dynamic_employer_file_430_path"
  add_index "dynamic_employer_file_430", ["size"], :name => "i_dynamic_employer_file_430_size"

  create_table "dynamic_employer_file_461", :force => true do |t|
    t.integer "owner_id"
    t.string  "name",         :limit => 256
    t.integer "size",         :limit => 8
    t.string  "content_type", :limit => 256
    t.text    "text_content"
    t.string  "path",         :limit => 1024
  end

  add_index "dynamic_employer_file_461", ["content_type"], :name => "i_dynamic_employer_file_461_content_type"
  add_index "dynamic_employer_file_461", ["id"], :name => "i_dynamic_employer_file_461_id"
  add_index "dynamic_employer_file_461", ["name"], :name => "i_dynamic_employer_file_461_name"
  add_index "dynamic_employer_file_461", ["owner_id"], :name => "i_dynamic_employer_file_461_owner_id"
  add_index "dynamic_employer_file_461", ["path"], :name => "i_dynamic_employer_file_461_path"
  add_index "dynamic_employer_file_461", ["size"], :name => "i_dynamic_employer_file_461_size"

  create_table "dynamic_employer_file_510", :force => true do |t|
    t.integer "owner_id"
    t.string  "name",         :limit => 256
    t.integer "size",         :limit => 8
    t.string  "content_type", :limit => 256
    t.text    "text_content"
    t.string  "path",         :limit => 1024
  end

  add_index "dynamic_employer_file_510", ["content_type"], :name => "i_dynamic_employer_file_510_content_type"
  add_index "dynamic_employer_file_510", ["id"], :name => "i_dynamic_employer_file_510_id"
  add_index "dynamic_employer_file_510", ["name"], :name => "i_dynamic_employer_file_510_name"
  add_index "dynamic_employer_file_510", ["owner_id"], :name => "i_dynamic_employer_file_510_owner_id"
  add_index "dynamic_employer_file_510", ["path"], :name => "i_dynamic_employer_file_510_path"
  add_index "dynamic_employer_file_510", ["size"], :name => "i_dynamic_employer_file_510_size"

  create_table "dynamic_employer_file_678", :force => true do |t|
    t.integer "owner_id"
    t.string  "name",         :limit => 256
    t.integer "size",         :limit => 8
    t.string  "content_type", :limit => 256
    t.text    "text_content"
    t.string  "path",         :limit => 1024
  end

  add_index "dynamic_employer_file_678", ["content_type"], :name => "i_dynamic_employer_file_678_content_type"
  add_index "dynamic_employer_file_678", ["id"], :name => "i_dynamic_employer_file_678_id"
  add_index "dynamic_employer_file_678", ["name"], :name => "i_dynamic_employer_file_678_name"
  add_index "dynamic_employer_file_678", ["owner_id"], :name => "i_dynamic_employer_file_678_owner_id"
  add_index "dynamic_employer_file_678", ["path"], :name => "i_dynamic_employer_file_678_path"
  add_index "dynamic_employer_file_678", ["size"], :name => "i_dynamic_employer_file_678_size"

  create_table "dynamic_employer_file_679", :force => true do |t|
    t.integer "owner_id"
    t.string  "name",         :limit => 256
    t.integer "size",         :limit => 8
    t.string  "content_type", :limit => 256
    t.text    "text_content"
    t.string  "path",         :limit => 1024
  end

  add_index "dynamic_employer_file_679", ["content_type"], :name => "i_dynamic_employer_file_679_content_type"
  add_index "dynamic_employer_file_679", ["id"], :name => "i_dynamic_employer_file_679_id"
  add_index "dynamic_employer_file_679", ["name"], :name => "i_dynamic_employer_file_679_name"
  add_index "dynamic_employer_file_679", ["owner_id"], :name => "i_dynamic_employer_file_679_owner_id"
  add_index "dynamic_employer_file_679", ["path"], :name => "i_dynamic_employer_file_679_path"
  add_index "dynamic_employer_file_679", ["size"], :name => "i_dynamic_employer_file_679_size"

  create_table "dynamic_employer_file_680", :force => true do |t|
    t.integer "owner_id"
    t.string  "name",         :limit => 256
    t.integer "size",         :limit => 8
    t.string  "content_type", :limit => 256
    t.text    "text_content"
    t.string  "path",         :limit => 1024
  end

  add_index "dynamic_employer_file_680", ["content_type"], :name => "i_dynamic_employer_file_680_content_type"
  add_index "dynamic_employer_file_680", ["id"], :name => "i_dynamic_employer_file_680_id"
  add_index "dynamic_employer_file_680", ["name"], :name => "i_dynamic_employer_file_680_name"
  add_index "dynamic_employer_file_680", ["owner_id"], :name => "i_dynamic_employer_file_680_owner_id"
  add_index "dynamic_employer_file_680", ["path"], :name => "i_dynamic_employer_file_680_path"
  add_index "dynamic_employer_file_680", ["size"], :name => "i_dynamic_employer_file_680_size"

  create_table "dynamic_employer_file_681", :force => true do |t|
    t.integer "owner_id"
    t.string  "name",         :limit => 256
    t.integer "size",         :limit => 8
    t.string  "content_type", :limit => 256
    t.text    "text_content"
    t.string  "path",         :limit => 1024
  end

  add_index "dynamic_employer_file_681", ["content_type"], :name => "i_dynamic_employer_file_681_content_type"
  add_index "dynamic_employer_file_681", ["id"], :name => "i_dynamic_employer_file_681_id"
  add_index "dynamic_employer_file_681", ["name"], :name => "i_dynamic_employer_file_681_name"
  add_index "dynamic_employer_file_681", ["owner_id"], :name => "i_dynamic_employer_file_681_owner_id"
  add_index "dynamic_employer_file_681", ["path"], :name => "i_dynamic_employer_file_681_path"
  add_index "dynamic_employer_file_681", ["size"], :name => "i_dynamic_employer_file_681_size"

  create_table "dynamic_employer_file_682", :force => true do |t|
    t.integer "owner_id"
    t.string  "name",         :limit => 256
    t.integer "size",         :limit => 8
    t.string  "content_type", :limit => 256
    t.text    "text_content"
    t.string  "path",         :limit => 1024
  end

  add_index "dynamic_employer_file_682", ["content_type"], :name => "i_dynamic_employer_file_682_content_type"
  add_index "dynamic_employer_file_682", ["id"], :name => "i_dynamic_employer_file_682_id"
  add_index "dynamic_employer_file_682", ["name"], :name => "i_dynamic_employer_file_682_name"
  add_index "dynamic_employer_file_682", ["owner_id"], :name => "i_dynamic_employer_file_682_owner_id"
  add_index "dynamic_employer_file_682", ["path"], :name => "i_dynamic_employer_file_682_path"
  add_index "dynamic_employer_file_682", ["size"], :name => "i_dynamic_employer_file_682_size"

  create_table "dynamic_employer_file_683", :force => true do |t|
    t.integer "owner_id"
    t.string  "name",         :limit => 256
    t.integer "size",         :limit => 8
    t.string  "content_type", :limit => 256
    t.text    "text_content"
    t.string  "path",         :limit => 1024
  end

  add_index "dynamic_employer_file_683", ["content_type"], :name => "i_dynamic_employer_file_683_content_type"
  add_index "dynamic_employer_file_683", ["id"], :name => "i_dynamic_employer_file_683_id"
  add_index "dynamic_employer_file_683", ["name"], :name => "i_dynamic_employer_file_683_name"
  add_index "dynamic_employer_file_683", ["owner_id"], :name => "i_dynamic_employer_file_683_owner_id"
  add_index "dynamic_employer_file_683", ["path"], :name => "i_dynamic_employer_file_683_path"
  add_index "dynamic_employer_file_683", ["size"], :name => "i_dynamic_employer_file_683_size"

  create_table "dynamic_employer_file_684", :force => true do |t|
    t.integer "owner_id"
    t.string  "name",         :limit => 256
    t.integer "size",         :limit => 8
    t.string  "content_type", :limit => 256
    t.text    "text_content"
    t.string  "path",         :limit => 1024
  end

  add_index "dynamic_employer_file_684", ["content_type"], :name => "i_dynamic_employer_file_684_content_type"
  add_index "dynamic_employer_file_684", ["id"], :name => "i_dynamic_employer_file_684_id"
  add_index "dynamic_employer_file_684", ["name"], :name => "i_dynamic_employer_file_684_name"
  add_index "dynamic_employer_file_684", ["owner_id"], :name => "i_dynamic_employer_file_684_owner_id"
  add_index "dynamic_employer_file_684", ["path"], :name => "i_dynamic_employer_file_684_path"
  add_index "dynamic_employer_file_684", ["size"], :name => "i_dynamic_employer_file_684_size"

  create_table "dynamic_employer_file_685", :force => true do |t|
    t.integer "owner_id"
    t.string  "name",         :limit => 256
    t.integer "size",         :limit => 8
    t.string  "content_type", :limit => 256
    t.text    "text_content"
    t.string  "path",         :limit => 1024
  end

  add_index "dynamic_employer_file_685", ["content_type"], :name => "i_dynamic_employer_file_685_content_type"
  add_index "dynamic_employer_file_685", ["id"], :name => "i_dynamic_employer_file_685_id"
  add_index "dynamic_employer_file_685", ["name"], :name => "i_dynamic_employer_file_685_name"
  add_index "dynamic_employer_file_685", ["owner_id"], :name => "i_dynamic_employer_file_685_owner_id"
  add_index "dynamic_employer_file_685", ["path"], :name => "i_dynamic_employer_file_685_path"
  add_index "dynamic_employer_file_685", ["size"], :name => "i_dynamic_employer_file_685_size"

  create_table "dynamic_employer_file_746", :force => true do |t|
    t.integer "owner_id"
    t.string  "name",         :limit => 256
    t.integer "size",         :limit => 8
    t.string  "content_type", :limit => 256
    t.text    "text_content"
    t.string  "path",         :limit => 1024
  end

  add_index "dynamic_employer_file_746", ["content_type"], :name => "i_dynamic_employer_file_746_content_type"
  add_index "dynamic_employer_file_746", ["id"], :name => "i_dynamic_employer_file_746_id"
  add_index "dynamic_employer_file_746", ["name"], :name => "i_dynamic_employer_file_746_name"
  add_index "dynamic_employer_file_746", ["owner_id"], :name => "i_dynamic_employer_file_746_owner_id"
  add_index "dynamic_employer_file_746", ["path"], :name => "i_dynamic_employer_file_746_path"
  add_index "dynamic_employer_file_746", ["size"], :name => "i_dynamic_employer_file_746_size"

  create_table "dynamic_employer_search_agent", :force => true do |t|
    t.integer "owner_id"
    t.text    "col82"
    t.text    "col118"
    t.integer "col132"
    t.boolean "col127"
    t.boolean "col176"
  end

  add_index "dynamic_employer_search_agent", ["col118"], :name => "i_dynamic_employer_search_agent_col118"
  add_index "dynamic_employer_search_agent", ["col127"], :name => "i_dynamic_employer_search_agent_col127"
  add_index "dynamic_employer_search_agent", ["col132"], :name => "i_dynamic_employer_search_agent_col132"
  add_index "dynamic_employer_search_agent", ["col176"], :name => "i_dynamic_employer_search_agent_col176"
  add_index "dynamic_employer_search_agent", ["col82"], :name => "i_dynamic_employer_search_agent_col82"
  add_index "dynamic_employer_search_agent", ["owner_id"], :name => "i_dempl_search_agent_oid"

  create_table "dynamic_employer_search_agent_dictionary_130", :id => false, :force => true do |t|
    t.integer "owner_id", :null => false
    t.integer "item_id",  :null => false
  end

  add_index "dynamic_employer_search_agent_dictionary_130", ["item_id"], :name => "i_dynamic_employer_search_agent_dictionary_130_item_id"
  add_index "dynamic_employer_search_agent_dictionary_130", ["owner_id"], :name => "i_dynamic_employer_search_agent_dictionary_130_owner_id"

  create_table "dynamic_employer_search_agent_dictionary_218", :id => false, :force => true do |t|
    t.integer "owner_id", :null => false
    t.integer "item_id",  :null => false
  end

  add_index "dynamic_employer_search_agent_dictionary_218", ["item_id"], :name => "i_dynamic_employer_search_agent_dictionary_218_item_id"
  add_index "dynamic_employer_search_agent_dictionary_218", ["owner_id"], :name => "i_dynamic_employer_search_agent_dictionary_218_owner_id"

  create_table "dynamic_employer_search_agent_dictionary_293", :id => false, :force => true do |t|
    t.integer "owner_id", :null => false
    t.integer "item_id",  :null => false
  end

  add_index "dynamic_employer_search_agent_dictionary_293", ["item_id"], :name => "i_dynamic_employer_search_agent_dictionary_293_item_id"
  add_index "dynamic_employer_search_agent_dictionary_293", ["owner_id"], :name => "i_dynamic_employer_search_agent_dictionary_293_owner_id"

  create_table "dynamic_field", :force => true do |t|
    t.integer "owner_id",   :null => false
    t.integer "type_id",    :null => false
    t.integer "sort_order"
    t.string  "short_name"
    t.integer "group_id"
    t.integer "master_id"
  end

  add_index "dynamic_field", ["owner_id"], :name => "i_dynamic_field_owner_id"
  add_index "dynamic_field", ["short_name"], :name => "i_dynamic_field_short_name"
  add_index "dynamic_field", ["sort_order"], :name => "i_dynamic_field_sort_order"
  add_index "dynamic_field", ["type_id"], :name => "i_dynamic_field_type_id"

  create_table "dynamic_field_property", :id => false, :force => true do |t|
    t.integer "owner_id",                :null => false
    t.string  "name",     :limit => 256, :null => false
    t.text    "value"
  end

  add_index "dynamic_field_property", ["name"], :name => "i_dynamic_field_property_name"
  add_index "dynamic_field_property", ["owner_id"], :name => "i_dynamic_field_property_owner_id"
  add_index "dynamic_field_property", ["value"], :name => "i_dynamic_field_property_value"

  create_table "dynamic_resume", :force => true do |t|
    t.integer  "col110"
    t.string   "col160",     :limit => 256
    t.string   "col161",     :limit => 256
    t.boolean  "col189"
    t.boolean  "col214"
    t.string   "col215",     :limit => 256
    t.string   "col216",     :limit => 256
    t.string   "col217",     :limit => 256
    t.datetime "col219"
    t.string   "col234",     :limit => 256
    t.string   "resume1",    :limit => nil
    t.string   "resume2",    :limit => nil
    t.string   "col283",     :limit => 256
    t.integer  "col308"
    t.string   "col380",     :limit => 256
    t.tsvector "tsv_col216"
    t.tsvector "tsv_col217"
    t.tsvector "tsv_col160"
    t.tsvector "tsv_col283"
    t.tsvector "tsv_col161"
    t.string   "col465",     :limit => 256
    t.string   "col466",     :limit => 256
    t.string   "col473",     :limit => 256
    t.string   "col483",     :limit => 256
    t.string   "col484",     :limit => 256
    t.string   "col491",     :limit => 256
    t.string   "col492",     :limit => 256
    t.text     "col499"
    t.string   "col500",     :limit => 256
    t.string   "col501",     :limit => 256
    t.string   "col502",     :limit => 256
    t.string   "col503",     :limit => 256
    t.string   "col504",     :limit => 256
    t.text     "col505"
    t.text     "col506"
    t.text     "col507"
    t.string   "col508",     :limit => 256
    t.text     "col509"
    t.boolean  "col515"
    t.string   "col516",     :limit => 256
    t.string   "col517",     :limit => 256
    t.integer  "col518"
    t.string   "col519",     :limit => 256
    t.datetime "col520"
    t.string   "col521",     :limit => 256
    t.string   "col522",     :limit => 256
    t.string   "col523",     :limit => 256
    t.text     "col524"
    t.string   "col526",     :limit => 256
    t.datetime "col527"
    t.string   "col528",     :limit => 256
    t.string   "col529",     :limit => 256
    t.string   "col530",     :limit => 256
    t.text     "col531"
    t.string   "col532",     :limit => 256
    t.datetime "col533"
    t.string   "col534",     :limit => 256
    t.string   "col535",     :limit => 256
    t.string   "col536",     :limit => 256
    t.text     "col537"
    t.string   "col538",     :limit => 256
    t.datetime "col539"
    t.string   "col540",     :limit => 256
    t.string   "col541",     :limit => 256
    t.string   "col542",     :limit => 256
    t.text     "col543"
    t.string   "col544",     :limit => 256
    t.datetime "col545"
    t.string   "col546",     :limit => 256
    t.string   "col547",     :limit => 256
    t.string   "col548",     :limit => 256
    t.text     "col549"
    t.integer  "col581"
    t.string   "col582",     :limit => 256
    t.datetime "col583"
    t.string   "col586",     :limit => 256
    t.datetime "col587"
    t.string   "col590",     :limit => 256
    t.datetime "col591"
    t.string   "col594",     :limit => 256
    t.datetime "col595"
    t.string   "col598",     :limit => 256
    t.datetime "col599"
    t.integer  "col602"
    t.string   "col603",     :limit => 256
    t.string   "col607",     :limit => 256
    t.string   "col611",     :limit => 256
    t.string   "col615",     :limit => 256
    t.string   "col619",     :limit => 256
    t.string   "col623",     :limit => 256
    t.integer  "col627"
    t.string   "col628",     :limit => 256
    t.string   "col629",     :limit => 256
    t.string   "col630",     :limit => 256
    t.text     "col631"
    t.string   "col632",     :limit => 256
    t.string   "col633",     :limit => 256
    t.string   "col634",     :limit => 256
    t.text     "col635"
    t.string   "col636",     :limit => 256
    t.string   "col637",     :limit => 256
    t.string   "col638",     :limit => 256
    t.text     "col639"
    t.string   "col640",     :limit => 256
    t.string   "col641",     :limit => 256
    t.string   "col642",     :limit => 256
    t.text     "col643"
    t.string   "col644",     :limit => 256
    t.string   "col645",     :limit => 256
    t.string   "col646",     :limit => 256
    t.text     "col647"
    t.boolean  "col648"
    t.tsvector "tsv_col519"
    t.tsvector "tsv_col628"
    t.tsvector "tsv_col629"
    t.tsvector "tsv_col501"
    t.tsvector "tsv_col502"
    t.tsvector "tsv_col509"
    t.datetime "col686"
    t.datetime "col687"
    t.datetime "col688"
    t.datetime "col689"
    t.datetime "col690"
    t.string   "col691",     :limit => 256
    t.string   "col692",     :limit => 256
    t.string   "col693",     :limit => 256
    t.string   "col694",     :limit => 256
    t.string   "col695",     :limit => 256
    t.text     "col696"
    t.text     "col697"
    t.text     "col698"
    t.text     "col699"
    t.text     "col700"
    t.datetime "col720"
    t.datetime "col721"
    t.datetime "col722"
    t.datetime "col723"
    t.datetime "col724"
    t.datetime "col725"
    t.datetime "col726"
    t.datetime "col727"
    t.datetime "col728"
    t.datetime "col729"
    t.datetime "col730"
    t.datetime "col731"
    t.string   "col732",     :limit => 256
    t.string   "col733",     :limit => 256
    t.string   "col734",     :limit => 256
    t.string   "col735",     :limit => 256
    t.string   "col736",     :limit => 256
    t.string   "col737",     :limit => 256
    t.text     "col738"
    t.text     "col739"
    t.text     "col740"
    t.text     "col741"
    t.text     "col742"
    t.text     "col743"
    t.tsvector "tsv_col526"
    t.tsvector "tsv_col532"
    t.tsvector "tsv_col538"
    t.tsvector "tsv_col544"
    t.tsvector "tsv_col632"
    t.tsvector "tsv_col636"
    t.tsvector "tsv_col640"
    t.tsvector "tsv_col644"
    t.tsvector "tsv_col582"
    t.tsvector "tsv_col691"
    t.tsvector "tsv_col586"
    t.tsvector "tsv_col692"
    t.tsvector "tsv_col590"
    t.tsvector "tsv_col693"
    t.tsvector "tsv_col594"
    t.tsvector "tsv_col694"
    t.tsvector "tsv_col598"
    t.tsvector "tsv_col695"
    t.tsvector "tsv_col603"
    t.tsvector "tsv_col607"
    t.tsvector "tsv_col611"
    t.tsvector "tsv_col615"
    t.tsvector "tsv_col619"
    t.tsvector "tsv_col623"
    t.tsvector "tsv_col633"
    t.tsvector "tsv_col637"
    t.tsvector "tsv_col641"
    t.tsvector "tsv_col645"
    t.tsvector "tsv_col499"
  end

  add_index "dynamic_resume", ["col110"], :name => "i_dynamic_resume_col110"
  add_index "dynamic_resume", ["col160"], :name => "i_dynamic_resume_col160"
  add_index "dynamic_resume", ["col161"], :name => "i_dynamic_resume_col161"
  add_index "dynamic_resume", ["col189"], :name => "i_dynamic_resume_col189"
  add_index "dynamic_resume", ["col214"], :name => "i_dynamic_resume_col214"
  add_index "dynamic_resume", ["col215"], :name => "i_dynamic_resume_col215"
  add_index "dynamic_resume", ["col216"], :name => "i_dynamic_resume_col216"
  add_index "dynamic_resume", ["col217"], :name => "i_dynamic_resume_col217"
  add_index "dynamic_resume", ["col219"], :name => "i_dynamic_resume_col219"
  add_index "dynamic_resume", ["col234"], :name => "i_dynamic_resume_col234"
  add_index "dynamic_resume", ["col283"], :name => "i_dynamic_resume_col283"
  add_index "dynamic_resume", ["col308"], :name => "i_dynamic_resume_col308"
  add_index "dynamic_resume", ["col380"], :name => "i_dynamic_resume_col380"
  add_index "dynamic_resume", ["col465"], :name => "i_dynamic_resume_col465"
  add_index "dynamic_resume", ["col466"], :name => "i_dynamic_resume_col466"
  add_index "dynamic_resume", ["col473"], :name => "i_dynamic_resume_col473"
  add_index "dynamic_resume", ["col483"], :name => "i_dynamic_resume_col483"
  add_index "dynamic_resume", ["col484"], :name => "i_dynamic_resume_col484"
  add_index "dynamic_resume", ["col491"], :name => "i_dynamic_resume_col491"
  add_index "dynamic_resume", ["col492"], :name => "i_dynamic_resume_col492"
  add_index "dynamic_resume", ["col500"], :name => "i_dynamic_resume_col500"
  add_index "dynamic_resume", ["col501"], :name => "i_dynamic_resume_col501"
  add_index "dynamic_resume", ["col502"], :name => "i_dynamic_resume_col502"
  add_index "dynamic_resume", ["col503"], :name => "i_dynamic_resume_col503"
  add_index "dynamic_resume", ["col504"], :name => "i_dynamic_resume_col504"
  add_index "dynamic_resume", ["col508"], :name => "i_dynamic_resume_col508"
  add_index "dynamic_resume", ["col515"], :name => "i_dynamic_resume_col515"
  add_index "dynamic_resume", ["col516"], :name => "i_dynamic_resume_col516"
  add_index "dynamic_resume", ["col517"], :name => "i_dynamic_resume_col517"
  add_index "dynamic_resume", ["col518"], :name => "i_dynamic_resume_col518"
  add_index "dynamic_resume", ["col519"], :name => "i_dynamic_resume_col519"
  add_index "dynamic_resume", ["col520"], :name => "i_dynamic_resume_col520"
  add_index "dynamic_resume", ["col521"], :name => "i_dynamic_resume_col521"
  add_index "dynamic_resume", ["col522"], :name => "i_dynamic_resume_col522"
  add_index "dynamic_resume", ["col523"], :name => "i_dynamic_resume_col523"
  add_index "dynamic_resume", ["col526"], :name => "i_dynamic_resume_col526"
  add_index "dynamic_resume", ["col527"], :name => "i_dynamic_resume_col527"
  add_index "dynamic_resume", ["col528"], :name => "i_dynamic_resume_col528"
  add_index "dynamic_resume", ["col529"], :name => "i_dynamic_resume_col529"
  add_index "dynamic_resume", ["col530"], :name => "i_dynamic_resume_col530"
  add_index "dynamic_resume", ["col532"], :name => "i_dynamic_resume_col532"
  add_index "dynamic_resume", ["col533"], :name => "i_dynamic_resume_col533"
  add_index "dynamic_resume", ["col534"], :name => "i_dynamic_resume_col534"
  add_index "dynamic_resume", ["col535"], :name => "i_dynamic_resume_col535"
  add_index "dynamic_resume", ["col536"], :name => "i_dynamic_resume_col536"
  add_index "dynamic_resume", ["col538"], :name => "i_dynamic_resume_col538"
  add_index "dynamic_resume", ["col539"], :name => "i_dynamic_resume_col539"
  add_index "dynamic_resume", ["col540"], :name => "i_dynamic_resume_col540"
  add_index "dynamic_resume", ["col541"], :name => "i_dynamic_resume_col541"
  add_index "dynamic_resume", ["col542"], :name => "i_dynamic_resume_col542"
  add_index "dynamic_resume", ["col544"], :name => "i_dynamic_resume_col544"
  add_index "dynamic_resume", ["col545"], :name => "i_dynamic_resume_col545"
  add_index "dynamic_resume", ["col546"], :name => "i_dynamic_resume_col546"
  add_index "dynamic_resume", ["col547"], :name => "i_dynamic_resume_col547"
  add_index "dynamic_resume", ["col548"], :name => "i_dynamic_resume_col548"
  add_index "dynamic_resume", ["col581"], :name => "i_dynamic_resume_col581"
  add_index "dynamic_resume", ["col582"], :name => "i_dynamic_resume_col582"
  add_index "dynamic_resume", ["col583"], :name => "i_dynamic_resume_col583"
  add_index "dynamic_resume", ["col586"], :name => "i_dynamic_resume_col586"
  add_index "dynamic_resume", ["col587"], :name => "i_dynamic_resume_col587"
  add_index "dynamic_resume", ["col590"], :name => "i_dynamic_resume_col590"
  add_index "dynamic_resume", ["col591"], :name => "i_dynamic_resume_col591"
  add_index "dynamic_resume", ["col594"], :name => "i_dynamic_resume_col594"
  add_index "dynamic_resume", ["col595"], :name => "i_dynamic_resume_col595"
  add_index "dynamic_resume", ["col598"], :name => "i_dynamic_resume_col598"
  add_index "dynamic_resume", ["col599"], :name => "i_dynamic_resume_col599"
  add_index "dynamic_resume", ["col602"], :name => "i_dynamic_resume_col602"
  add_index "dynamic_resume", ["col603"], :name => "i_dynamic_resume_col603"
  add_index "dynamic_resume", ["col607"], :name => "i_dynamic_resume_col607"
  add_index "dynamic_resume", ["col611"], :name => "i_dynamic_resume_col611"
  add_index "dynamic_resume", ["col615"], :name => "i_dynamic_resume_col615"
  add_index "dynamic_resume", ["col619"], :name => "i_dynamic_resume_col619"
  add_index "dynamic_resume", ["col623"], :name => "i_dynamic_resume_col623"
  add_index "dynamic_resume", ["col627"], :name => "i_dynamic_resume_col627"
  add_index "dynamic_resume", ["col628"], :name => "i_dynamic_resume_col628"
  add_index "dynamic_resume", ["col629"], :name => "i_dynamic_resume_col629"
  add_index "dynamic_resume", ["col630"], :name => "i_dynamic_resume_col630"
  add_index "dynamic_resume", ["col632"], :name => "i_dynamic_resume_col632"
  add_index "dynamic_resume", ["col633"], :name => "i_dynamic_resume_col633"
  add_index "dynamic_resume", ["col634"], :name => "i_dynamic_resume_col634"
  add_index "dynamic_resume", ["col636"], :name => "i_dynamic_resume_col636"
  add_index "dynamic_resume", ["col637"], :name => "i_dynamic_resume_col637"
  add_index "dynamic_resume", ["col638"], :name => "i_dynamic_resume_col638"
  add_index "dynamic_resume", ["col640"], :name => "i_dynamic_resume_col640"
  add_index "dynamic_resume", ["col641"], :name => "i_dynamic_resume_col641"
  add_index "dynamic_resume", ["col642"], :name => "i_dynamic_resume_col642"
  add_index "dynamic_resume", ["col644"], :name => "i_dynamic_resume_col644"
  add_index "dynamic_resume", ["col645"], :name => "i_dynamic_resume_col645"
  add_index "dynamic_resume", ["col646"], :name => "i_dynamic_resume_col646"
  add_index "dynamic_resume", ["col648"], :name => "i_dynamic_resume_col648"
  add_index "dynamic_resume", ["col686"], :name => "i_dynamic_resume_col686"
  add_index "dynamic_resume", ["col687"], :name => "i_dynamic_resume_col687"
  add_index "dynamic_resume", ["col688"], :name => "i_dynamic_resume_col688"
  add_index "dynamic_resume", ["col689"], :name => "i_dynamic_resume_col689"
  add_index "dynamic_resume", ["col690"], :name => "i_dynamic_resume_col690"
  add_index "dynamic_resume", ["col691"], :name => "i_dynamic_resume_col691"
  add_index "dynamic_resume", ["col692"], :name => "i_dynamic_resume_col692"
  add_index "dynamic_resume", ["col693"], :name => "i_dynamic_resume_col693"
  add_index "dynamic_resume", ["col694"], :name => "i_dynamic_resume_col694"
  add_index "dynamic_resume", ["col695"], :name => "i_dynamic_resume_col695"
  add_index "dynamic_resume", ["col720"], :name => "i_dynamic_resume_col720"
  add_index "dynamic_resume", ["col721"], :name => "i_dynamic_resume_col721"
  add_index "dynamic_resume", ["col722"], :name => "i_dynamic_resume_col722"
  add_index "dynamic_resume", ["col723"], :name => "i_dynamic_resume_col723"
  add_index "dynamic_resume", ["col724"], :name => "i_dynamic_resume_col724"
  add_index "dynamic_resume", ["col725"], :name => "i_dynamic_resume_col725"
  add_index "dynamic_resume", ["col726"], :name => "i_dynamic_resume_col726"
  add_index "dynamic_resume", ["col727"], :name => "i_dynamic_resume_col727"
  add_index "dynamic_resume", ["col728"], :name => "i_dynamic_resume_col728"
  add_index "dynamic_resume", ["col729"], :name => "i_dynamic_resume_col729"
  add_index "dynamic_resume", ["col730"], :name => "i_dynamic_resume_col730"
  add_index "dynamic_resume", ["col731"], :name => "i_dynamic_resume_col731"
  add_index "dynamic_resume", ["col732"], :name => "i_dynamic_resume_col732"
  add_index "dynamic_resume", ["col733"], :name => "i_dynamic_resume_col733"
  add_index "dynamic_resume", ["col734"], :name => "i_dynamic_resume_col734"
  add_index "dynamic_resume", ["col735"], :name => "i_dynamic_resume_col735"
  add_index "dynamic_resume", ["col736"], :name => "i_dynamic_resume_col736"
  add_index "dynamic_resume", ["col737"], :name => "i_dynamic_resume_col737"
  add_index "dynamic_resume", ["tsv_col160"], :name => "i_dynamic_resume_tsv_col160"
  add_index "dynamic_resume", ["tsv_col161"], :name => "i_dynamic_resume_tsv_col161"
  add_index "dynamic_resume", ["tsv_col216"], :name => "i_dynamic_resume_tsv_col216"
  add_index "dynamic_resume", ["tsv_col217"], :name => "i_dynamic_resume_tsv_col217"
  add_index "dynamic_resume", ["tsv_col283"], :name => "i_dynamic_resume_tsv_col283"
  add_index "dynamic_resume", ["tsv_col499"], :name => "i_dynamic_resume_tsv_col499"
  add_index "dynamic_resume", ["tsv_col501"], :name => "i_dynamic_resume_tsv_col501"
  add_index "dynamic_resume", ["tsv_col502"], :name => "i_dynamic_resume_tsv_col502"
  add_index "dynamic_resume", ["tsv_col509"], :name => "i_dynamic_resume_tsv_col509"
  add_index "dynamic_resume", ["tsv_col519"], :name => "i_dynamic_resume_tsv_col519"
  add_index "dynamic_resume", ["tsv_col526"], :name => "i_dynamic_resume_tsv_col526"
  add_index "dynamic_resume", ["tsv_col532"], :name => "i_dynamic_resume_tsv_col532"
  add_index "dynamic_resume", ["tsv_col538"], :name => "i_dynamic_resume_tsv_col538"
  add_index "dynamic_resume", ["tsv_col544"], :name => "i_dynamic_resume_tsv_col544"
  add_index "dynamic_resume", ["tsv_col582"], :name => "i_dynamic_resume_tsv_col582"
  add_index "dynamic_resume", ["tsv_col586"], :name => "i_dynamic_resume_tsv_col586"
  add_index "dynamic_resume", ["tsv_col590"], :name => "i_dynamic_resume_tsv_col590"
  add_index "dynamic_resume", ["tsv_col594"], :name => "i_dynamic_resume_tsv_col594"
  add_index "dynamic_resume", ["tsv_col598"], :name => "i_dynamic_resume_tsv_col598"
  add_index "dynamic_resume", ["tsv_col603"], :name => "i_dynamic_resume_tsv_col603"
  add_index "dynamic_resume", ["tsv_col607"], :name => "i_dynamic_resume_tsv_col607"
  add_index "dynamic_resume", ["tsv_col611"], :name => "i_dynamic_resume_tsv_col611"
  add_index "dynamic_resume", ["tsv_col615"], :name => "i_dynamic_resume_tsv_col615"
  add_index "dynamic_resume", ["tsv_col619"], :name => "i_dynamic_resume_tsv_col619"
  add_index "dynamic_resume", ["tsv_col623"], :name => "i_dynamic_resume_tsv_col623"
  add_index "dynamic_resume", ["tsv_col628"], :name => "i_dynamic_resume_tsv_col628"
  add_index "dynamic_resume", ["tsv_col629"], :name => "i_dynamic_resume_tsv_col629"
  add_index "dynamic_resume", ["tsv_col632"], :name => "i_dynamic_resume_tsv_col632"
  add_index "dynamic_resume", ["tsv_col633"], :name => "i_dynamic_resume_tsv_col633"
  add_index "dynamic_resume", ["tsv_col636"], :name => "i_dynamic_resume_tsv_col636"
  add_index "dynamic_resume", ["tsv_col637"], :name => "i_dynamic_resume_tsv_col637"
  add_index "dynamic_resume", ["tsv_col640"], :name => "i_dynamic_resume_tsv_col640"
  add_index "dynamic_resume", ["tsv_col641"], :name => "i_dynamic_resume_tsv_col641"
  add_index "dynamic_resume", ["tsv_col644"], :name => "i_dynamic_resume_tsv_col644"
  add_index "dynamic_resume", ["tsv_col645"], :name => "i_dynamic_resume_tsv_col645"
  add_index "dynamic_resume", ["tsv_col691"], :name => "i_dynamic_resume_tsv_col691"
  add_index "dynamic_resume", ["tsv_col692"], :name => "i_dynamic_resume_tsv_col692"
  add_index "dynamic_resume", ["tsv_col693"], :name => "i_dynamic_resume_tsv_col693"
  add_index "dynamic_resume", ["tsv_col694"], :name => "i_dynamic_resume_tsv_col694"
  add_index "dynamic_resume", ["tsv_col695"], :name => "i_dynamic_resume_tsv_col695"

  create_table "dynamic_resume_dictionary_745", :id => false, :force => true do |t|
    t.integer "owner_id", :null => false
    t.integer "item_id",  :null => false
  end

  add_index "dynamic_resume_dictionary_745", ["item_id"], :name => "i_dynamic_resume_dictionary_745_item_id"
  add_index "dynamic_resume_dictionary_745", ["owner_id"], :name => "i_dynamic_resume_dictionary_745_owner_id"

  create_table "dynamic_resume_file_192", :force => true do |t|
    t.integer  "owner_id"
    t.string   "name",             :limit => 256
    t.integer  "size",             :limit => 8
    t.string   "content_type",     :limit => 256
    t.text     "text_content"
    t.string   "path",             :limit => 1024
    t.tsvector "tsv_text_content"
  end

  add_index "dynamic_resume_file_192", ["content_type"], :name => "i_dynamic_resume_file_192_content_type"
  add_index "dynamic_resume_file_192", ["name"], :name => "i_dynamic_resume_file_192_name"
  add_index "dynamic_resume_file_192", ["owner_id"], :name => "i_dynamic_resume_file_192_owner_id"
  add_index "dynamic_resume_file_192", ["path"], :name => "i_dynamic_resume_file_192_path"
  add_index "dynamic_resume_file_192", ["size"], :name => "i_dynamic_resume_file_192_size"
  add_index "dynamic_resume_file_192", ["tsv_text_content"], :name => "i_dynamic_resume_file_192_tsv_text_content"

  create_table "dynamic_resume_file_376", :force => true do |t|
    t.integer "owner_id"
    t.string  "name",         :limit => 256
    t.integer "size",         :limit => 8
    t.string  "content_type", :limit => 256
    t.text    "text_content"
    t.string  "path",         :limit => 1024
  end

  add_index "dynamic_resume_file_376", ["content_type"], :name => "i_dynamic_resume_file_376_content_type"
  add_index "dynamic_resume_file_376", ["id"], :name => "i_dynamic_resume_file_376_id"
  add_index "dynamic_resume_file_376", ["name"], :name => "i_dynamic_resume_file_376_name"
  add_index "dynamic_resume_file_376", ["owner_id"], :name => "i_dynamic_resume_file_376_owner_id"
  add_index "dynamic_resume_file_376", ["path"], :name => "i_dynamic_resume_file_376_path"
  add_index "dynamic_resume_file_376", ["size"], :name => "i_dynamic_resume_file_376_size"

  create_table "dynamic_resume_file_754", :force => true do |t|
    t.integer "owner_id"
    t.string  "name",         :limit => 256
    t.integer "size",         :limit => 8
    t.string  "content_type", :limit => 256
    t.text    "text_content"
    t.string  "path",         :limit => 1024
  end

  add_index "dynamic_resume_file_754", ["content_type"], :name => "i_dynamic_resume_file_754_content_type"
  add_index "dynamic_resume_file_754", ["id"], :name => "i_dynamic_resume_file_754_id"
  add_index "dynamic_resume_file_754", ["name"], :name => "i_dynamic_resume_file_754_name"
  add_index "dynamic_resume_file_754", ["owner_id"], :name => "i_dynamic_resume_file_754_owner_id"
  add_index "dynamic_resume_file_754", ["path"], :name => "i_dynamic_resume_file_754_path"
  add_index "dynamic_resume_file_754", ["size"], :name => "i_dynamic_resume_file_754_size"

  create_table "dynamic_resume_file_755", :force => true do |t|
    t.integer "owner_id"
    t.string  "name",         :limit => 256
    t.integer "size",         :limit => 8
    t.string  "content_type", :limit => 256
    t.text    "text_content"
    t.string  "path",         :limit => 1024
  end

  add_index "dynamic_resume_file_755", ["content_type"], :name => "i_dynamic_resume_file_755_content_type"
  add_index "dynamic_resume_file_755", ["id"], :name => "i_dynamic_resume_file_755_id"
  add_index "dynamic_resume_file_755", ["name"], :name => "i_dynamic_resume_file_755_name"
  add_index "dynamic_resume_file_755", ["owner_id"], :name => "i_dynamic_resume_file_755_owner_id"
  add_index "dynamic_resume_file_755", ["path"], :name => "i_dynamic_resume_file_755_path"
  add_index "dynamic_resume_file_755", ["size"], :name => "i_dynamic_resume_file_755_size"

  create_table "dynamic_resume_view_history", :id => false, :force => true do |t|
    t.integer  "id",       :null => false
    t.integer  "owner_id", :null => false
    t.datetime "date",     :null => false
  end

  add_index "dynamic_resume_view_history", ["date"], :name => "i_dynamic_resume_view_history_date"
  add_index "dynamic_resume_view_history", ["id"], :name => "i_dynamic_resume_view_history_id"
  add_index "dynamic_resume_view_history", ["owner_id"], :name => "i_dynamic_resume_view_history_owner_id"

  create_table "dynamic_resume_xmlfeed_search_agent", :force => true do |t|
    t.integer "owner_id"
    t.text    "col188"
  end

  add_index "dynamic_resume_xmlfeed_search_agent", ["col188"], :name => "i_dynamic_resume_xmlfeed_search_agent_col188"
  add_index "dynamic_resume_xmlfeed_search_agent", ["owner_id"], :name => "i_dres_xml_sea_oid"

  create_table "dynamic_search", :force => true do |t|
    t.integer "owner_id",     :null => false
    t.integer "criterion_id", :null => false
    t.integer "sort_order"
    t.string  "short_name"
  end

  add_index "dynamic_search", ["criterion_id"], :name => "i_dynamic_search_criterion_id"
  add_index "dynamic_search", ["owner_id"], :name => "i_dynamic_search_owner_id"
  add_index "dynamic_search", ["short_name"], :name => "i_dynamic_search_short_name"
  add_index "dynamic_search", ["sort_order"], :name => "i_dynamic_search_sort_order"

  create_table "dynamic_search_post_date_range", :force => true do |t|
    t.integer "owner_id",                   :null => false
    t.string  "name",        :limit => 256
    t.integer "period"
    t.integer "period_type"
    t.integer "sort_order"
  end

  add_index "dynamic_search_post_date_range", ["name"], :name => "i_dynamic_search_post_date_range_name"
  add_index "dynamic_search_post_date_range", ["owner_id"], :name => "i_dynamic_search_post_date_range_owner_id"
  add_index "dynamic_search_post_date_range", ["period"], :name => "i_dynamic_search_post_date_range_period"
  add_index "dynamic_search_post_date_range", ["period_type"], :name => "i_dynamic_search_post_date_range_period_type"
  add_index "dynamic_search_post_date_range", ["sort_order"], :name => "i_dynamic_search_post_date_range_sort_order"

  create_table "dynamic_search_property", :id => false, :force => true do |t|
    t.integer "owner_id",                :null => false
    t.string  "name",     :limit => 256, :null => false
    t.text    "value"
  end

  add_index "dynamic_search_property", ["name"], :name => "i_dynamic_search_property_name"
  add_index "dynamic_search_property", ["owner_id"], :name => "i_dynamic_search_property_owner_id"
  add_index "dynamic_search_property", ["value"], :name => "i_dynamic_search_property_value"

  create_table "dynamic_search_salary_range", :force => true do |t|
    t.integer "owner_id",                   :null => false
    t.string  "name",        :limit => 256
    t.integer "salary_from"
    t.integer "salary_to"
    t.string  "period",      :limit => 64
    t.integer "sort_order"
  end

  add_index "dynamic_search_salary_range", ["name"], :name => "i_dynamic_search_salary_range_name"
  add_index "dynamic_search_salary_range", ["owner_id"], :name => "i_dynamic_search_salary_range_owner_id"
  add_index "dynamic_search_salary_range", ["period"], :name => "i_dynamic_search_salary_range_period"
  add_index "dynamic_search_salary_range", ["salary_from"], :name => "i_dynamic_search_salary_range_salary_from"
  add_index "dynamic_search_salary_range", ["salary_to"], :name => "i_dynamic_search_salary_range_salary_to"
  add_index "dynamic_search_salary_range", ["sort_order"], :name => "i_dynamic_search_salary_range_sort_order"

  create_table "dynamic_seo_rule", :force => true do |t|
    t.integer "owner_id"
    t.integer "type_id"
    t.string  "col101",   :limit => 256
    t.text    "col105"
    t.string  "col106",   :limit => 300
    t.string  "col108",   :limit => 256
    t.string  "col245",   :limit => 350
    t.string  "col247",   :limit => 600
    t.string  "col248",   :limit => 400
  end

  add_index "dynamic_seo_rule", ["col101"], :name => "i_dynamic_seo_rule_col101"
  add_index "dynamic_seo_rule", ["col105"], :name => "i_dynamic_seo_rule_col105"
  add_index "dynamic_seo_rule", ["col106"], :name => "i_dynamic_seo_rule_col106"
  add_index "dynamic_seo_rule", ["col108"], :name => "i_dynamic_seo_rule_col108"
  add_index "dynamic_seo_rule", ["col245"], :name => "i_dynamic_seo_rule_col245"
  add_index "dynamic_seo_rule", ["col247"], :name => "i_dynamic_seo_rule_col247"
  add_index "dynamic_seo_rule", ["col248"], :name => "i_dynamic_seo_rule_col248"
  add_index "dynamic_seo_rule", ["owner_id"], :name => "i_dynamic_seo_rule_owner_id"
  add_index "dynamic_seo_rule", ["type_id"], :name => "i_dynamic_seo_rule_type_id"

  create_table "dynamic_seo_rule_search", :force => true do |t|
    t.integer "owner_id"
    t.integer "col155"
    t.text    "col158"
    t.boolean "col180"
    t.integer "col184"
    t.integer "col299"
    t.integer "col300"
    t.integer "col301"
  end

  add_index "dynamic_seo_rule_search", ["col155"], :name => "i_dynamic_seo_rule_search_col155"
  add_index "dynamic_seo_rule_search", ["col158"], :name => "i_dynamic_seo_rule_search_col158"
  add_index "dynamic_seo_rule_search", ["col180"], :name => "i_dynamic_seo_rule_search_col180"
  add_index "dynamic_seo_rule_search", ["col184"], :name => "i_dynamic_seo_rule_search_col184"
  add_index "dynamic_seo_rule_search", ["col299"], :name => "i_dynamic_seo_rule_search_col299"
  add_index "dynamic_seo_rule_search", ["col300"], :name => "i_dynamic_seo_rule_search_col300"
  add_index "dynamic_seo_rule_search", ["col301"], :name => "i_dynamic_seo_rule_search_col301"
  add_index "dynamic_seo_rule_search", ["owner_id"], :name => "i_dynamic_seo_rule_search_owner_id"

  create_table "dynamic_vacancy", :force => true do |t|
    t.integer  "col28"
    t.string   "col69",      :limit => 256
    t.datetime "col70"
    t.datetime "col71"
    t.string   "col82",      :limit => 256
    t.boolean  "col93"
    t.string   "col99",      :limit => 256
    t.boolean  "col118"
    t.integer  "col119"
    t.string   "col131",     :limit => 256
    t.integer  "col138"
    t.string   "col145",     :limit => 256
    t.datetime "col211"
    t.boolean  "col235"
    t.boolean  "col239"
    t.integer  "col319"
    t.integer  "col320"
    t.boolean  "col321"
    t.boolean  "col322"
    t.boolean  "col337"
    t.string   "col338",     :limit => 256
    t.string   "col339",     :limit => 256
    t.tsvector "tsv40"
    t.tsvector "tsv54"
    t.tsvector "tsv55"
    t.tsvector "tsv271"
    t.tsvector "tsv272"
    t.tsvector "tsv_col69"
    t.tsvector "tsv_col145"
    t.tsvector "tsv_col82"
    t.string   "col378",     :limit => 256
    t.text     "col418"
    t.text     "col419"
    t.text     "col420"
    t.text     "col421"
    t.text     "col422"
    t.text     "col423"
    t.integer  "col487"
    t.integer  "col512"
    t.integer  "col650"
    t.string   "col744",     :limit => 256
    t.tsvector "tsv_col418"
    t.boolean  "col757"
    t.tsvector "tsv_col420"
  end

  add_index "dynamic_vacancy", ["col118"], :name => "i_dynamic_vacancy_col118"
  add_index "dynamic_vacancy", ["col119"], :name => "i_dynamic_vacancy_col119"
  add_index "dynamic_vacancy", ["col131"], :name => "i_dynamic_vacancy_col131"
  add_index "dynamic_vacancy", ["col138"], :name => "i_dynamic_vacancy_col138"
  add_index "dynamic_vacancy", ["col145"], :name => "i_dynamic_vacancy_col145"
  add_index "dynamic_vacancy", ["col211"], :name => "i_dynamic_vacancy_col211"
  add_index "dynamic_vacancy", ["col235"], :name => "i_dynamic_vacancy_col235"
  add_index "dynamic_vacancy", ["col239"], :name => "i_dynamic_vacancy_col239"
  add_index "dynamic_vacancy", ["col28"], :name => "i_dynamic_vacancy_col28"
  add_index "dynamic_vacancy", ["col319"], :name => "i_dynamic_vacancy_col319"
  add_index "dynamic_vacancy", ["col320"], :name => "i_dynamic_vacancy_col320"
  add_index "dynamic_vacancy", ["col321"], :name => "i_dynamic_vacancy_col321"
  add_index "dynamic_vacancy", ["col322"], :name => "i_dynamic_vacancy_col322"
  add_index "dynamic_vacancy", ["col337"], :name => "i_dynamic_vacancy_col337"
  add_index "dynamic_vacancy", ["col338"], :name => "i_dynamic_vacancy_col338"
  add_index "dynamic_vacancy", ["col339"], :name => "i_dynamic_vacancy_col339"
  add_index "dynamic_vacancy", ["col378"], :name => "i_dynamic_vacancy_col378"
  add_index "dynamic_vacancy", ["col487"], :name => "i_dynamic_vacancy_col487"
  add_index "dynamic_vacancy", ["col512"], :name => "i_dynamic_vacancy_col512"
  add_index "dynamic_vacancy", ["col650"], :name => "i_dynamic_vacancy_col650"
  add_index "dynamic_vacancy", ["col69"], :name => "i_dynamic_vacancy_col69"
  add_index "dynamic_vacancy", ["col70"], :name => "i_dynamic_vacancy_col70"
  add_index "dynamic_vacancy", ["col71"], :name => "i_dynamic_vacancy_col71"
  add_index "dynamic_vacancy", ["col744"], :name => "i_dynamic_vacancy_col744"
  add_index "dynamic_vacancy", ["col757"], :name => "i_dynamic_vacancy_col757"
  add_index "dynamic_vacancy", ["col82"], :name => "i_dynamic_vacancy_col82"
  add_index "dynamic_vacancy", ["col93"], :name => "i_dynamic_vacancy_col93"
  add_index "dynamic_vacancy", ["col99"], :name => "i_dynamic_vacancy_col99"
  add_index "dynamic_vacancy", ["tsv271"], :name => "i_dynamic_vacancy_tsv271"
  add_index "dynamic_vacancy", ["tsv272"], :name => "i_dynamic_vacancy_tsv272"
  add_index "dynamic_vacancy", ["tsv40"], :name => "i_dynamic_vacancy_tsv40"
  add_index "dynamic_vacancy", ["tsv54"], :name => "i_dynamic_vacancy_tsv54"
  add_index "dynamic_vacancy", ["tsv55"], :name => "i_dynamic_vacancy_tsv55"
  add_index "dynamic_vacancy", ["tsv_col145"], :name => "i_dynamic_vacancy_tsv_col145"
  add_index "dynamic_vacancy", ["tsv_col418"], :name => "i_dynamic_vacancy_tsv_col418"
  add_index "dynamic_vacancy", ["tsv_col420"], :name => "i_dynamic_vacancy_tsv_col420"
  add_index "dynamic_vacancy", ["tsv_col69"], :name => "i_dynamic_vacancy_tsv_col69"
  add_index "dynamic_vacancy", ["tsv_col82"], :name => "i_dynamic_vacancy_tsv_col82"

  create_table "dynamic_vacancy_dictionary_257", :id => false, :force => true do |t|
    t.integer "owner_id", :null => false
    t.integer "item_id",  :null => false
  end

  add_index "dynamic_vacancy_dictionary_257", ["item_id"], :name => "i_dynamic_vacancy_dictionary_257_item_id"
  add_index "dynamic_vacancy_dictionary_257", ["owner_id"], :name => "i_dynamic_vacancy_dictionary_257_owner_id"

  create_table "dynamic_vacancy_dictionary_87", :id => false, :force => true do |t|
    t.integer "owner_id", :null => false
    t.integer "item_id",  :null => false
  end

  add_index "dynamic_vacancy_dictionary_87", ["item_id"], :name => "i_dynamic_vacancy_dictionary_87_item_id"
  add_index "dynamic_vacancy_dictionary_87", ["owner_id"], :name => "i_dynamic_vacancy_dictionary_87_owner_id"

  create_table "dynamic_vacancy_view_history", :id => false, :force => true do |t|
    t.integer  "id",       :null => false
    t.integer  "owner_id", :null => false
    t.datetime "date",     :null => false
  end

  add_index "dynamic_vacancy_view_history", ["date"], :name => "i_dynamic_vacancy_view_history_date"
  add_index "dynamic_vacancy_view_history", ["id"], :name => "i_dynamic_vacancy_view_history_id"
  add_index "dynamic_vacancy_view_history", ["owner_id"], :name => "i_dynamic_vacancy_view_history_owner_id"

  create_table "dynamic_vacancy_xmlfeed_search_agent", :force => true do |t|
    t.integer "owner_id"
    t.text    "col181"
    t.integer "col182"
    t.boolean "col251"
  end

  add_index "dynamic_vacancy_xmlfeed_search_agent", ["col181"], :name => "i_dynamic_vacancy_xmlfeed_search_agent_col181"
  add_index "dynamic_vacancy_xmlfeed_search_agent", ["col182"], :name => "i_dynamic_vacancy_xmlfeed_search_agent_col182"
  add_index "dynamic_vacancy_xmlfeed_search_agent", ["col251"], :name => "i_dynamic_vacancy_xmlfeed_search_agent_col251"
  add_index "dynamic_vacancy_xmlfeed_search_agent", ["owner_id"], :name => "i_dvac_xml_searchag_oid"

  create_table "email_template", :force => true do |t|
    t.string  "name"
    t.text    "from_address"
    t.text    "to_address"
    t.string  "subject"
    t.text    "body"
    t.boolean "include_attach"
    t.text    "replyto_address"
    t.text    "bcc_address"
  end

  add_index "email_template", ["from_address"], :name => "i_email_template_from_address"
  add_index "email_template", ["include_attach"], :name => "i_email_template_include_attach"
  add_index "email_template", ["name"], :name => "i_email_template_name"
  add_index "email_template", ["to_address"], :name => "i_email_template_to_address"

  create_table "email_template_event", :id => false, :force => true do |t|
    t.integer "template_id", :null => false
    t.integer "type_id"
  end

  add_index "email_template_event", ["template_id"], :name => "i_email_template_event_template_id"
  add_index "email_template_event", ["type_id"], :name => "i_email_template_event_tid"

  create_table "employer_auto_response", :force => true do |t|
    t.string  "name",           :limit => nil
    t.integer "employer_id"
    t.string  "from_address",   :limit => nil
    t.string  "to_address",     :limit => nil
    t.string  "subject",        :limit => nil
    t.text    "body"
    t.boolean "include_attach"
  end

  add_index "employer_auto_response", ["employer_id"], :name => "i_employer_auto_response_eid"

  create_table "employer_screening_question", :force => true do |t|
    t.integer "employer_id",                       :null => false
    t.string  "name",               :limit => nil
    t.integer "score"
    t.text    "email_no_pass_text"
    t.text    "email_pass_text"
    t.boolean "shared"
  end

  add_index "employer_screening_question", ["employer_id"], :name => "i_employer_screening_question_employer_id"
  add_index "employer_screening_question", ["name"], :name => "i_employer_screening_question_name"
  add_index "employer_screening_question", ["shared"], :name => "i_employer_screening_question_s"

  create_table "employer_screening_question_status", :id => false, :force => true do |t|
    t.integer "id",                             :null => false
    t.integer "employer_screening_question_id", :null => false
    t.integer "vacancy_id",                     :null => false
    t.integer "candidate_id",                   :null => false
    t.boolean "passed",                         :null => false
    t.boolean "sent",                           :null => false
    t.integer "score",                          :null => false
  end

  add_index "employer_screening_question_status", ["candidate_id"], :name => "i_employer_screening_question_status_cid"
  add_index "employer_screening_question_status", ["employer_screening_question_id"], :name => "i_employer_screening_question_status_quid"
  add_index "employer_screening_question_status", ["passed"], :name => "i_employer_screening_question_status_pass"
  add_index "employer_screening_question_status", ["score"], :name => "i_employer_screening_question_status_score"
  add_index "employer_screening_question_status", ["sent"], :name => "i_employer_screening_question_status_sent"
  add_index "employer_screening_question_status", ["vacancy_id"], :name => "i_employer_screening_question_status_vid"

  create_table "event", :force => true do |t|
    t.datetime "date_created"
    t.integer  "candidate_id"
    t.integer  "type_id"
    t.integer  "employer_id"
    t.integer  "vacancy_id"
    t.integer  "resume_id"
    t.string   "session_id"
    t.text     "referer"
    t.text     "landing"
  end

  add_index "event", ["candidate_id"], :name => "i_event_candidate_id"
  add_index "event", ["date_created"], :name => "i_event_date_created"
  add_index "event", ["employer_id"], :name => "i_event_employer_id"
  add_index "event", ["resume_id"], :name => "i_event_resume_id"
  add_index "event", ["type_id"], :name => "i_event_type_id"
  add_index "event", ["vacancy_id"], :name => "i_event_vacancy_id"

  create_table "event_entity", :id => false, :force => true do |t|
    t.integer "event_id",    :null => false
    t.integer "entity_id",   :null => false
    t.integer "entity_type"
  end

  add_index "event_entity", ["entity_id"], :name => "i_event_entity_entity_id"
  add_index "event_entity", ["entity_type"], :name => "i_event_entity_type"
  add_index "event_entity", ["event_id"], :name => "i_event_entity_event_id"

  create_table "feed", :id => false, :force => true do |t|
    t.integer "id",                        :null => false
    t.string  "name",       :limit => nil
    t.string  "short_name", :limit => nil
  end

  add_index "feed", ["name"], :name => "i_feed_name"
  add_index "feed", ["short_name"], :name => "i_feed_short_name"

  create_table "feed_category", :id => false, :force => true do |t|
    t.integer "id",                  :null => false
    t.string  "name", :limit => nil
  end

  create_table "feed_content", :id => false, :force => true do |t|
    t.integer  "id",                             :null => false
    t.integer  "feed_url_id",                    :null => false
    t.integer  "directnews_id",                  :null => false
    t.datetime "date_created",                   :null => false
    t.string   "heading",         :limit => nil
    t.string   "long_heading",    :limit => nil
    t.text     "contents"
    t.text     "summary"
    t.string   "large_image_url", :limit => nil
    t.string   "small_image_url", :limit => nil
  end

  add_index "feed_content", ["date_created"], :name => "i_feed_content_date_created"
  add_index "feed_content", ["directnews_id"], :name => "i_feed_content_directnews_id"
  add_index "feed_content", ["feed_url_id"], :name => "i_feed_content_feed_url_id"
  add_index "feed_content", ["heading"], :name => "i_feed_content_heading"
  add_index "feed_content", ["large_image_url"], :name => "i_feed_content_large_image_url"
  add_index "feed_content", ["long_heading"], :name => "i_feed_content_long_heading"
  add_index "feed_content", ["small_image_url"], :name => "i_feed_content_small_image_url"
  add_index "feed_content", ["summary"], :name => "i_feed_content_summary"

  create_table "feed_content_category", :id => false, :force => true do |t|
    t.integer "id",       :null => false
    t.integer "owner_id"
    t.integer "item_id"
  end

  add_index "feed_content_category", ["item_id"], :name => "i_feed_content_category_item_id"
  add_index "feed_content_category", ["owner_id"], :name => "i_feed_content_category_owner_id"

  create_table "feed_url", :id => false, :force => true do |t|
    t.integer "id",                     :null => false
    t.integer "feed_id",                :null => false
    t.string  "url",     :limit => nil
  end

  add_index "feed_url", ["feed_id"], :name => "i_feed_url_feed_id"
  add_index "feed_url", ["url"], :name => "i_feed_url_url"

  create_table "field_parameters", :id => false, :force => true do |t|
    t.integer "field_id",                :default => 0,  :null => false
    t.string  "shortname", :limit => 64, :default => "", :null => false
    t.text    "_value",                                  :null => false
  end

  add_index "field_parameters", ["field_id", "shortname"], :name => "field_parameters_field_id_key", :unique => true
  add_index "field_parameters", ["field_id"], :name => "i_fparams_id"

  create_table "field_values", :id => false, :force => true do |t|
    t.integer  "field_id",        :default => 0, :null => false
    t.integer  "node_id",         :default => 0, :null => false
    t.float    "value_float"
    t.text     "value_str"
    t.datetime "value_timestamp"
  end

  add_index "field_values", ["node_id"], :name => "field_values_idx2"
  add_index "field_values", ["value_float"], :name => "i_field_values_fl"
  add_index "field_values", ["value_timestamp"], :name => "i_field_values_ts"

  create_table "gadget_container_properties", :force => true do |t|
    t.integer "coord_x",                   :null => false
    t.integer "coord_y",                   :null => false
    t.integer "height",                    :null => false
    t.integer "width",                     :null => false
    t.boolean "minimized"
    t.integer "user_id",                   :null => false
    t.string  "gadget_type", :limit => 64
  end

  add_index "gadget_container_properties", ["minimized"], :name => "i_gcp_min"
  add_index "gadget_container_properties", ["user_id"], :name => "i_gcp_uid"

  create_table "google_calendar_properties", :id => false, :force => true do |t|
    t.integer "gcp_id",                       :null => false
    t.string  "view_type",     :limit => 254
    t.integer "width"
    t.integer "height"
    t.string  "week_day",      :limit => 254
    t.string  "language",      :limit => 254
    t.string  "time_zone",     :limit => 254
    t.string  "gmail_account", :limit => 254
  end

  create_table "group_rights", :id => false, :force => true do |t|
    t.integer "group_id", :default => 0, :null => false
    t.integer "node_id",  :default => 0, :null => false
    t.integer "rights",   :default => 0, :null => false
  end

  add_index "group_rights", ["node_id"], :name => "i_group_rights_node_id"

  create_table "help_tree", :id => false, :force => true do |t|
    t.integer "id",                              :null => false
    t.integer "parent_id"
    t.string  "lang",          :limit => 2,      :null => false
    t.string  "name",          :limit => 128,    :null => false
    t.string  "content",       :limit => 102400, :null => false
    t.integer "subtree_order",                   :null => false
    t.boolean "expanded",                        :null => false
  end

  add_index "help_tree", ["expanded"], :name => "i_help_tree_ex"
  add_index "help_tree", ["parent_id"], :name => "i_help_tree_pid"
  add_index "help_tree", ["subtree_order"], :name => "i_help_tree_order"

  create_table "img_lib_images", :id => false, :force => true do |t|
    t.string  "folder",      :limit => 1024, :null => false
    t.string  "name",        :limit => 250,  :null => false
    t.integer "width",                       :null => false
    t.integer "height",                      :null => false
    t.string  "description", :limit => 1024, :null => false
  end

  create_table "job_apply", :id => false, :force => true do |t|
    t.integer  "candidate_id", :null => false
    t.integer  "vacancy_id",   :null => false
    t.datetime "apply_date"
    t.boolean  "history_show"
  end

  add_index "job_apply", ["apply_date"], :name => "i_job_apply_apply_date"
  add_index "job_apply", ["candidate_id"], :name => "i_job_apply_candidate_id"
  add_index "job_apply", ["history_show"], :name => "i_job_apply_history_show"
  add_index "job_apply", ["vacancy_id"], :name => "i_job_apply_vacancy_id"

  create_table "job_slot", :force => true do |t|
    t.integer  "owner_id"
    t.integer  "item_id"
    t.integer  "status"
    t.boolean  "selected"
    t.integer  "available_days"
    t.datetime "last_viewed_date"
    t.integer  "next"
  end

  add_index "job_slot", ["available_days"], :name => "i_job_slot_available_days"
  add_index "job_slot", ["item_id"], :name => "i_job_slot_item_id"
  add_index "job_slot", ["last_viewed_date"], :name => "i_job_slot_last_viewed_date"
  add_index "job_slot", ["next"], :name => "i_job_slot_last_next"
  add_index "job_slot", ["owner_id"], :name => "i_job_slot_owner_id"
  add_index "job_slot", ["selected"], :name => "i_job_slot_selected"
  add_index "job_slot", ["status"], :name => "i_job_slot_status"

  create_table "log_method", :force => true do |t|
    t.integer  "request_id",                 :null => false
    t.string   "class_name",  :limit => 254
    t.string   "method_name", :limit => 254
    t.datetime "start_dttm"
    t.datetime "end_dttm"
  end

  add_index "log_method", ["class_name"], :name => "i_log_method_class_name"
  add_index "log_method", ["end_dttm"], :name => "i_log_method_end_dttm"
  add_index "log_method", ["method_name"], :name => "i_log_method_method_name"
  add_index "log_method", ["request_id"], :name => "i_log_method_request_id"
  add_index "log_method", ["start_dttm"], :name => "i_log_method_start_dttm"

  create_table "log_request", :force => true do |t|
    t.integer  "session_id"
    t.string   "uri",            :limit => 254
    t.text     "query_str"
    t.string   "user_info",      :limit => 254
    t.datetime "start_dttm"
    t.datetime "end_dttm"
    t.text     "exception_text"
  end

  add_index "log_request", ["end_dttm"], :name => "i_log_request_end_dttm"
  add_index "log_request", ["exception_text"], :name => "i_log_request_exception_text"
  add_index "log_request", ["query_str"], :name => "i_log_request_query_str"
  add_index "log_request", ["session_id"], :name => "i_log_request_session_id"
  add_index "log_request", ["start_dttm"], :name => "i_log_request_start_dttm"
  add_index "log_request", ["uri"], :name => "i_log_request_uri"
  add_index "log_request", ["user_info"], :name => "i_log_request_user_info"

  create_table "log_session", :force => true do |t|
    t.datetime "start_dttm"
    t.datetime "end_dttm"
    t.text     "headers_text"
    t.string   "server_name",  :limit => 254
    t.string   "app_version",  :limit => 254
    t.string   "bot_name",     :limit => 254
  end

  add_index "log_session", ["app_version"], :name => "i_log_session_app_version"
  add_index "log_session", ["bot_name"], :name => "i_log_session_bot_name"
  add_index "log_session", ["end_dttm"], :name => "i_log_session_end_dttm"
  add_index "log_session", ["headers_text"], :name => "i_log_session_headers_text"
  add_index "log_session", ["server_name"], :name => "i_log_session_server_name"
  add_index "log_session", ["start_dttm"], :name => "i_log_session_start_dttm"

  create_table "message", :force => true do |t|
    t.text     "text"
    t.integer  "from_candidate_id"
    t.integer  "to_candidate_id"
    t.integer  "from_employer_id"
    t.integer  "to_employer_id"
    t.datetime "send_time",         :null => false
    t.boolean  "read",              :null => false
    t.boolean  "archived_from"
    t.boolean  "archived_to"
  end

  add_index "message", ["archived_from"], :name => "i_message_afrom"
  add_index "message", ["archived_to"], :name => "i_message_ato"
  add_index "message", ["from_candidate_id"], :name => "fki_message_from_candidate_id"
  add_index "message", ["from_employer_id"], :name => "fki_message_from_employer_id"
  add_index "message", ["read"], :name => "i_message_read"
  add_index "message", ["send_time"], :name => "i_message_st"
  add_index "message", ["to_candidate_id"], :name => "fki_to_candidate_id"
  add_index "message", ["to_employer_id"], :name => "fki_to_employer_id"

  create_table "message_attach", :force => true do |t|
    t.integer "message_id",                  :null => false
    t.string  "filename",     :limit => nil, :null => false
    t.integer "filesize",     :limit => 8,   :null => false
    t.string  "content_type", :limit => nil, :null => false
    t.string  "file",         :limit => nil, :null => false
  end

  add_index "message_attach", ["message_id"], :name => "i_message_attach_mid"

  create_table "node_dependencies", :id => false, :force => true do |t|
    t.integer "node_id",            :default => 0, :null => false
    t.integer "submissed_class_id", :default => 0, :null => false
  end

  add_index "node_dependencies", ["node_id", "submissed_class_id"], :name => "node_dependencies_node_id_key", :unique => true

  create_table "nodes", :id => false, :force => true do |t|
    t.integer "id",                              :default => 0,  :null => false
    t.string  "shortname",        :limit => 132, :default => "", :null => false
    t.string  "name",             :limit => 128, :default => "", :null => false
    t.string  "dynamic_template", :limit => 128, :default => "", :null => false
    t.integer "class_id",                        :default => 0,  :null => false
    t.integer "subtree_order",                   :default => 0,  :null => false
    t.integer "parent_id"
    t.text    "absolute_path"
    t.string  "admin_url"
    t.integer "help_id"
    t.boolean "confirm",                                         :null => false
    t.boolean "cutfromurl"
    t.boolean "showatadmintree"
  end

  add_index "nodes", ["absolute_path"], :name => "nodes_apath_idx", :unique => true
  add_index "nodes", ["class_id"], :name => "i_nodes_class_id"
  add_index "nodes", ["parent_id", "shortname"], :name => "nodes_parent_id_key1", :unique => true
  add_index "nodes", ["parent_id", "subtree_order"], :name => "nodes_parent_id_key", :unique => true
  add_index "nodes", ["parent_id"], :name => "i_nodes_parent_id"
  add_index "nodes", ["shortname"], :name => "i_nodes_shname"
  add_index "nodes", ["subtree_order"], :name => "i_nodes_subtree"

  create_table "nodes_submission", :id => false, :force => true do |t|
    t.integer "child_id",   :default => 0, :null => false
    t.integer "parent_id",  :default => 0, :null => false
    t.integer "level_diff", :default => 0, :null => false
  end

  add_index "nodes_submission", ["child_id"], :name => "i_nodessubm_c_id"
  add_index "nodes_submission", ["parent_id", "child_id"], :name => "i_nodessubm_cp_id"
  add_index "nodes_submission", ["parent_id"], :name => "i_nodessubm_p_id"

  create_table "notifications", :force => true do |t|
    t.integer  "entity_id"
    t.integer  "entity_id_vacancy"
    t.integer  "entity_id_candidate"
    t.integer  "notification_type_id"
    t.datetime "date"
  end

  add_index "notifications", ["date"], :name => "i_notifications_date"
  add_index "notifications", ["entity_id"], :name => "i_notifications_entity_id"
  add_index "notifications", ["entity_id_candidate"], :name => "i_notifications_entity_id_candidate"
  add_index "notifications", ["entity_id_vacancy"], :name => "i_notifications_entity_id_vacancy"
  add_index "notifications", ["notification_type_id"], :name => "i_notifications_notification_type_id"

  create_table "package", :force => true do |t|
    t.string  "name",                   :limit => 256
    t.decimal "price",                                 :precision => 10, :scale => 2
    t.text    "manual_description"
    t.integer "user_type_id",                                                         :null => false
    t.integer "currency_id",                                                          :null => false
    t.boolean "dont_show_on_front_end",                                               :null => false
    t.boolean "recurring"
    t.integer "recurring_period_type"
    t.integer "recurring_period"
    t.integer "trial_period_type"
    t.integer "trial_period"
  end

  add_index "package", ["currency_id"], :name => "fki_package_currency_id"
  add_index "package", ["name"], :name => "i_package_name"
  add_index "package", ["price"], :name => "i_package_price"

  create_table "package_paid_item", :force => true do |t|
    t.integer "type"
    t.integer "quantity"
    t.integer "period"
    t.integer "period_type"
    t.boolean "period_increment"
    t.boolean "single_action"
    t.integer "quantity_min"
    t.integer "quantity_max"
    t.integer "active_period_days"
    t.string  "name",               :limit => 512
    t.integer "user_type_id",                      :null => false
  end

  add_index "package_paid_item", ["active_period_days"], :name => "i_package_paid_item_active_period_days"
  add_index "package_paid_item", ["period"], :name => "i_package_paid_item_period"
  add_index "package_paid_item", ["period_increment"], :name => "i_package_paid_item_period_increment"
  add_index "package_paid_item", ["period_type"], :name => "i_package_paid_item_period_type"
  add_index "package_paid_item", ["quantity"], :name => "i_package_paid_item_quantity"
  add_index "package_paid_item", ["quantity_max"], :name => "i_package_paid_item_quantity_max"
  add_index "package_paid_item", ["quantity_min"], :name => "i_package_paid_item_quantity_min"
  add_index "package_paid_item", ["single_action"], :name => "i_package_paid_item_single_action"
  add_index "package_paid_item", ["type"], :name => "i_package_paid_item_type"

  create_table "package_to_package_paid_item", :force => true do |t|
    t.integer "package_id",           :null => false
    t.integer "package_paid_item_id", :null => false
  end

  add_index "package_to_package_paid_item", ["id"], :name => "i_packadge_to_package_paid_item_id"
  add_index "package_to_package_paid_item", ["package_id"], :name => "i_packadge_to_package_paid_item_package_id"
  add_index "package_to_package_paid_item", ["package_paid_item_id"], :name => "i_packadge_to_package_paid_item_package_paid_item_id"

  create_table "paid_item", :force => true do |t|
    t.integer  "payment_pack_id"
    t.integer  "user_id"
    t.integer  "type"
    t.datetime "date_created"
    t.datetime "date_expired"
    t.boolean  "activated",          :default => false
    t.boolean  "single_action"
    t.integer  "period_type"
    t.integer  "period"
    t.integer  "active_period_days"
    t.integer  "user_type_id"
  end

  add_index "paid_item", ["activated"], :name => "i_paid_item_activated"
  add_index "paid_item", ["active_period_days"], :name => "i_paid_item_active_period_days"
  add_index "paid_item", ["date_created"], :name => "i_paid_item_date_created"
  add_index "paid_item", ["date_expired"], :name => "i_paid_item_date_expired"
  add_index "paid_item", ["id"], :name => "i_paid_item_id"
  add_index "paid_item", ["payment_pack_id"], :name => "i_paid_item_payment_pack_id"
  add_index "paid_item", ["single_action"], :name => "i_paid_item_single_action"
  add_index "paid_item", ["type"], :name => "i_paid_item_type"
  add_index "paid_item", ["user_id"], :name => "i_paid_item_user_id"

  create_table "payment", :force => true do |t|
    t.integer  "user_id"
    t.string   "hash",                   :limit => 26,                                                :null => false
    t.text     "description"
    t.decimal  "amount",                                :precision => 10, :scale => 2
    t.decimal  "tax",                                   :precision => 10, :scale => 2
    t.integer  "method"
    t.datetime "date_created"
    t.integer  "processing_status_type",                                               :default => 1
    t.integer  "user_type_id"
    t.datetime "date_received"
    t.integer  "coupon_id"
    t.string   "merchant_order_id",      :limit => 256
    t.integer  "payment_system_id"
  end

  add_index "payment", ["amount"], :name => "i_payment_amount"
  add_index "payment", ["date_created"], :name => "i_payment_date_created"
  add_index "payment", ["description"], :name => "i_payment_tx_id"
  add_index "payment", ["hash"], :name => "i_payment_hash"
  add_index "payment", ["id"], :name => "i_payment_id"
  add_index "payment", ["method"], :name => "i_payment_method"
  add_index "payment", ["tax"], :name => "i_payment_tax"
  add_index "payment", ["user_id"], :name => "i_payment_user_id"

  create_table "payment_currency", :force => true do |t|
    t.string  "name",       :limit => 5, :null => false
    t.integer "sort_order"
  end

  add_index "payment_currency", ["sort_order"], :name => "i_payment_currency_so"

  create_table "payment_package", :force => true do |t|
    t.integer "payment_id", :null => false
    t.integer "package_id", :null => false
    t.integer "quantity"
  end

  add_index "payment_package", ["id"], :name => "i_payment_package_id"
  add_index "payment_package", ["package_id"], :name => "i_payment_package_package_id"
  add_index "payment_package", ["payment_id"], :name => "i_payment_package_payment_id"
  add_index "payment_package", ["quantity"], :name => "i_payment_package_quantity"

  create_table "payment_parameters", :force => true do |t|
    t.string  "name",              :limit => 64
    t.string  "value",             :limit => 256
    t.integer "payment_system_id"
  end

  add_index "payment_parameters", ["name"], :name => "i_payment_parameters_name"
  add_index "payment_parameters", ["payment_system_id"], :name => "i_payment_parameters_payment_system"
  add_index "payment_parameters", ["value"], :name => "i_payment_parameters_value"

  create_table "payment_region", :force => true do |t|
    t.string  "country_name", :limit => 64
    t.integer "currency_id"
  end

  add_index "payment_region", ["country_name"], :name => "i_currency_country_name"
  add_index "payment_region", ["currency_id"], :name => "i_payment_region_cid"

  create_table "payment_system", :force => true do |t|
    t.string  "name",                       :limit => 64
    t.string  "img_src",                    :limit => 256
    t.string  "action_url",                 :limit => 256
    t.text    "invoice_template"
    t.text    "candidate_invoice_template"
    t.boolean "recurring"
  end

  add_index "payment_system", ["action_url"], :name => "i_payment_system_action_url"
  add_index "payment_system", ["name"], :name => "i_payment_system_name"
  add_index "payment_system", ["recurring"], :name => "i_payment_system_rec"

  create_table "post_template", :force => true do |t|
    t.string  "name"
    t.integer "method_type", :null => false
    t.string  "url"
    t.text    "postbody"
  end

  add_index "post_template", ["method_type"], :name => "i_post_template_method_type"
  add_index "post_template", ["name"], :name => "i_post_template_body"
  add_index "post_template", ["url"], :name => "i_email_template_url"

  create_table "post_template_event", :id => false, :force => true do |t|
    t.integer "template_id",               :null => false
    t.string  "event_type",  :limit => 64, :null => false
  end

  add_index "post_template_event", ["template_id"], :name => "i_post_template_event_template_id"

  create_table "post_template_manager", :force => true do |t|
    t.integer "post_template", :null => false
    t.integer "try_count"
    t.text    "parameters"
  end

  add_index "post_template_manager", ["parameters"], :name => "i_post_template_queue_parameters"
  add_index "post_template_manager", ["post_template"], :name => "i_post_template_manager_post_template"

  create_table "post_tool_feed", :force => true do |t|
    t.integer  "type_id"
    t.integer  "user_id"
    t.string   "name",                     :limit => 256
    t.text     "template"
    t.integer  "update_interval"
    t.datetime "date_updated"
    t.datetime "last_date_posted_vacancy"
    t.integer  "count_updated_last_hour"
    t.integer  "count_updated_last_day"
    t.datetime "last_date_updated_day"
    t.boolean  "reverse_order"
  end

  add_index "post_tool_feed", ["date_updated"], :name => "i_post_tool_feed_date_updated"
  add_index "post_tool_feed", ["name"], :name => "i_post_tool_feed_name"
  add_index "post_tool_feed", ["template"], :name => "i_post_tool_feed_template"
  add_index "post_tool_feed", ["type_id"], :name => "i_post_tool_feed_type_id"
  add_index "post_tool_feed", ["update_interval"], :name => "i_post_tool_feed_update_interval"
  add_index "post_tool_feed", ["user_id"], :name => "i_post_tool_feed_user_id"

  create_table "post_tool_feed_criteria", :force => true do |t|
    t.integer "owner_id"
    t.integer "col263"
    t.integer "col264"
  end

  add_index "post_tool_feed_criteria", ["col263"], :name => "i_post_tool_feed_criteria_col263"
  add_index "post_tool_feed_criteria", ["col264"], :name => "i_post_tool_feed_criteria_col264"
  add_index "post_tool_feed_criteria", ["owner_id"], :name => "i_post_tool_feed_criteria_owner_id"

  create_table "post_tool_user", :force => true do |t|
    t.integer "type_id"
    t.string  "username",        :limit => 32
    t.string  "password",        :limit => 32
    t.string  "consumer_key"
    t.string  "consumer_secret"
    t.string  "access_token"
    t.string  "access_secret"
    t.string  "pin",             :limit => 32
  end

  add_index "post_tool_user", ["password"], :name => "i_post_tool_user_password"
  add_index "post_tool_user", ["type_id"], :name => "i_post_tool_user_type_id"
  add_index "post_tool_user", ["username"], :name => "i_post_tool_user_username"
  add_index "post_tool_user", ["username"], :name => "post_tool_user_username_key", :unique => true

  create_table "postcode", :force => true do |t|
    t.string  "name",   :limit => 64, :null => false
    t.integer "coordx"
    t.integer "coordy"
    t.float   "lat"
    t.float   "lon"
    t.float   "milex"
    t.float   "miley"
  end

  add_index "postcode", ["coordx"], :name => "i_postcode_coordx"
  add_index "postcode", ["coordy"], :name => "i_postcode_coordy"
  add_index "postcode", ["id"], :name => "i_postcode_id"
  add_index "postcode", ["lat"], :name => "i_postcode_lat"
  add_index "postcode", ["lon"], :name => "i_postcode_lon"
  add_index "postcode", ["milex"], :name => "i_postcode_milex"
  add_index "postcode", ["miley"], :name => "i_postcode_miley"
  add_index "postcode", ["name"], :name => "i_postcode_name"

  create_table "question", :force => true do |t|
    t.integer "owner_id",                    :null => false
    t.string  "name",         :limit => nil
    t.boolean "required"
    t.integer "answers_type"
    t.integer "sort_order"
  end

  add_index "question", ["answers_type"], :name => "i_question_at"
  add_index "question", ["owner_id"], :name => "i_question_oid"
  add_index "question", ["required"], :name => "i_question_req"
  add_index "question", ["sort_order"], :name => "i_question_so"

  create_table "redirect_template", :id => false, :force => true do |t|
    t.integer "id",                      :null => false
    t.integer "type_id"
    t.string  "name",     :limit => 256
    t.text    "template"
  end

  add_index "redirect_template", ["id"], :name => "pk_redirect_template_id", :unique => true
  add_index "redirect_template", ["name"], :name => "i_redirect_template_name"
  add_index "redirect_template", ["template"], :name => "i_redirect_template_template"
  add_index "redirect_template", ["type_id"], :name => "i_redirect_template_type_id"

  create_table "region_package", :id => false, :force => true do |t|
    t.integer "owner_id",   :null => false
    t.integer "id",         :null => false
    t.integer "sort_order", :null => false
  end

  add_index "region_package", ["id"], :name => "i_region_package_id"
  add_index "region_package", ["owner_id"], :name => "i_region_package_oid"
  add_index "region_package", ["sort_order"], :name => "i_region_package_so"

  create_table "report", :force => true do |t|
    t.integer "group_id",                      :null => false
    t.string  "name",           :limit => 254, :null => false
    t.text    "sql_query"
    t.string  "refresh_period", :limit => 64
    t.boolean "all_results"
  end

  add_index "report", ["group_id"], :name => "i_report_group_id"
  add_index "report", ["name"], :name => "i_report_name"

  create_table "report_chart", :force => true do |t|
    t.integer "report_id",                     :null => false
    t.string  "title",          :limit => 254, :null => false
    t.integer "chart_type",                    :null => false
    t.integer "height",                        :null => false
    t.integer "width",                         :null => false
    t.string  "category_label", :limit => 254, :null => false
    t.string  "value_label",    :limit => 254, :null => false
  end

  add_index "report_chart", ["category_label"], :name => "i_report_chart_category_label"
  add_index "report_chart", ["chart_type"], :name => "i_report_chart_chart_type"
  add_index "report_chart", ["height"], :name => "i_report_chart_height"
  add_index "report_chart", ["report_id"], :name => "i_report_chart_report_id"
  add_index "report_chart", ["title"], :name => "i_report_chart_title"
  add_index "report_chart", ["value_label"], :name => "i_report_chart_value_label"
  add_index "report_chart", ["width"], :name => "i_report_chart_width"

  create_table "report_column", :force => true do |t|
    t.integer "report_id",                 :null => false
    t.string  "name",       :limit => 254, :null => false
    t.string  "expression", :limit => 254, :null => false
    t.integer "data_type",                 :null => false
    t.integer "order_num",                 :null => false
    t.integer "hor_align",                 :null => false
    t.integer "width",                     :null => false
    t.string  "pattern",    :limit => 256
  end

  add_index "report_column", ["data_type"], :name => "i_report_column_data_type"
  add_index "report_column", ["expression"], :name => "i_report_column_expression"
  add_index "report_column", ["hor_align"], :name => "i_report_column_hor_align"
  add_index "report_column", ["name"], :name => "i_report_column_name"
  add_index "report_column", ["order_num"], :name => "i_report_column_order_num"
  add_index "report_column", ["pattern"], :name => "i_report_column_pattern"
  add_index "report_column", ["report_id"], :name => "i_report_column_report_id"
  add_index "report_column", ["width"], :name => "i_report_column_width"

  create_table "report_design_template", :force => true do |t|
    t.string  "name",              :limit => 254, :null => false
    t.boolean "use_paging"
    t.boolean "link_target_blank"
    t.string  "font_name",         :limit => 254, :null => false
    t.integer "font_size",                        :null => false
    t.integer "report_width",                     :null => false
    t.integer "report_height",                    :null => false
    t.integer "title_height",                     :null => false
    t.integer "column_height",                    :null => false
    t.boolean "is_relative"
    t.integer "left_margin",                      :null => false
    t.integer "right_margin",                     :null => false
    t.integer "top_margin",                       :null => false
    t.integer "bottom_margin",                    :null => false
    t.boolean "show_meta_info"
    t.boolean "draw_border"
  end

  create_table "report_gadget_properties", :id => false, :force => true do |t|
    t.integer "gcp_id",                     :null => false
    t.integer "report_id",                  :null => false
    t.string  "report_name", :limit => 254
    t.boolean "active"
  end

  add_index "report_gadget_properties", ["active"], :name => "i_report_gadget_properties_act"
  add_index "report_gadget_properties", ["report_id"], :name => "i_report_gadget_properties_rid"

  create_table "report_group", :force => true do |t|
    t.string "name", :limit => 254, :null => false
  end

  add_index "report_group", ["name"], :name => "i_report_group_name"

  create_table "report_layout", :id => false, :force => true do |t|
    t.integer "layout_type_id",     :null => false
    t.integer "design_template_id", :null => false
  end

  add_index "report_layout", ["design_template_id"], :name => "i_report_layout_dtid"

  create_table "report_parameter", :force => true do |t|
    t.integer "report_id",                     :null => false
    t.string  "name",           :limit => 254, :null => false
    t.integer "jdbc_type",                     :null => false
    t.integer "order_num",                     :null => false
    t.boolean "required"
    t.integer "parameter_type"
    t.text    "sql"
  end

  add_index "report_parameter", ["jdbc_type"], :name => "i_report_parameter_jdbc_type"
  add_index "report_parameter", ["name"], :name => "i_report_parameter_name"
  add_index "report_parameter", ["order_num"], :name => "i_report_parameter_order_num"
  add_index "report_parameter", ["parameter_type"], :name => "i_report_parameter_parameter_type"
  add_index "report_parameter", ["report_id"], :name => "i_report_parameter_report_id"
  add_index "report_parameter", ["required"], :name => "i_report_parameter_required"

  create_table "rss_feed", :force => true do |t|
    t.string  "name",            :limit => 256
    t.string  "url",             :limit => 1024
    t.integer "items_number"
    t.integer "update_interval"
    t.text    "template"
    t.text    "content"
    t.text    "date_updated"
  end

  create_table "rss_feed_properties", :id => false, :force => true do |t|
    t.integer "gcp_id",                      :null => false
    t.string  "feed_url",     :limit => 254
    t.integer "refresh_time"
  end

  create_table "saved_resumes", :id => false, :force => true do |t|
    t.integer "owner_id", :null => false
    t.integer "item_id",  :null => false
    t.boolean "hidden"
  end

  add_index "saved_resumes", ["hidden"], :name => "i_saved_resumes_hid"

  create_table "saved_vacancies", :id => false, :force => true do |t|
    t.integer "item_id",  :null => false
    t.integer "owner_id", :null => false
  end

  add_index "saved_vacancies", ["item_id"], :name => "i_saved_vacancies_vacancyid"
  add_index "saved_vacancies", ["owner_id"], :name => "i_saved_vacancies_userid"

  create_table "screening_question_answer", :force => true do |t|
    t.integer "vacancy_id"
    t.integer "candidate_id"
    t.string  "question",     :limit => nil
    t.text    "answer"
    t.boolean "correct"
  end

  add_index "screening_question_answer", ["candidate_id"], :name => "i_screening_question_answer_candidate_id"
  add_index "screening_question_answer", ["correct"], :name => "i_screening_question_answer_corr"
  add_index "screening_question_answer", ["vacancy_id"], :name => "i_screening_question_answer_vid"

  create_table "search_agent", :force => true do |t|
    t.string   "name",               :limit => 256
    t.integer  "type"
    t.integer  "period_type"
    t.datetime "date"
    t.boolean  "active"
    t.integer  "candidate_id"
    t.integer  "employer_id"
    t.text     "xml_pattern_header"
    t.text     "xml_pattern_body"
    t.text     "xml_pattern_footer"
    t.text     "hash"
  end

  add_index "search_agent", ["active"], :name => "i_search_agent_active"
  add_index "search_agent", ["candidate_id"], :name => "i_search_agent_candidate_id"
  add_index "search_agent", ["date"], :name => "i_search_agent_date"
  add_index "search_agent", ["hash"], :name => "i_search_agent_hash"
  add_index "search_agent", ["name"], :name => "i_search_agent_name"
  add_index "search_agent", ["period_type"], :name => "i_search_agent_period_type"
  add_index "search_agent", ["type"], :name => "i_search_agent_type"

  create_table "seo_ai_criterion_settings", :force => true do |t|
    t.integer "criterion_id"
    t.integer "quantity"
  end

  add_index "seo_ai_criterion_settings", ["criterion_id"], :name => "i_seo_ai_criterion_settings_criterion_id"
  add_index "seo_ai_criterion_settings", ["quantity"], :name => "i_seo_ai_criterion_settings_quantity"

  create_table "seo_ai_file", :force => true do |t|
    t.string "path", :limit => 1024
  end

  create_table "seo_ai_keyword", :force => true do |t|
    t.integer "criterion_id"
    t.integer "dictionary_item_id"
    t.boolean "optimize"
    t.string  "name",               :limit => 256
    t.string  "shortname",          :limit => 256
    t.boolean "must"
    t.boolean "skip"
    t.boolean "current_top"
    t.integer "statistics",                        :default => 0
  end

  add_index "seo_ai_keyword", ["criterion_id", "shortname"], :name => "uk_criterion_id_shortname", :unique => true
  add_index "seo_ai_keyword", ["criterion_id"], :name => "i_seo_ai_keyword_criterion_id"
  add_index "seo_ai_keyword", ["current_top"], :name => "i_seo_ai_keyword_current_top"
  add_index "seo_ai_keyword", ["dictionary_item_id"], :name => "i_seo_ai_keyword_dictionary_item_id"
  add_index "seo_ai_keyword", ["must"], :name => "i_seo_ai_keyword_must"
  add_index "seo_ai_keyword", ["name"], :name => "i_seo_ai_keyword_name"
  add_index "seo_ai_keyword", ["optimize"], :name => "i_seo_ai_keyword_optimize"
  add_index "seo_ai_keyword", ["shortname"], :name => "i_seo_ai_keyword_shortname"
  add_index "seo_ai_keyword", ["skip"], :name => "i_seo_ai_keyword_skip"

  create_table "seo_ai_keyword_season", :force => true do |t|
    t.integer "keyword_id"
    t.integer "type_id"
    t.date    "date_from"
    t.date    "date_to"
  end

  add_index "seo_ai_keyword_season", ["keyword_id"], :name => "i_seo_ai_keyword_season_kid"
  add_index "seo_ai_keyword_season", ["type_id"], :name => "i_seo_ai_keyword_season_tid"

  create_table "seo_ai_keyword_synonym", :force => true do |t|
    t.integer "keyword_id"
    t.string  "name",       :limit => 256
    t.boolean "mistaken"
    t.boolean "current"
  end

  add_index "seo_ai_keyword_synonym", ["current"], :name => "i_sai_kwd_syn_curr"
  add_index "seo_ai_keyword_synonym", ["keyword_id"], :name => "i_sai_kwd_syn_kid"
  add_index "seo_ai_keyword_synonym", ["mistaken"], :name => "i_sai_kwd_syn_mist"

  create_table "seo_ai_settings", :id => false, :force => true do |t|
    t.string "name",  :limit => 256, :null => false
    t.text   "value"
  end

  add_index "seo_ai_settings", ["name"], :name => "i_seo_ai_settings_name"
  add_index "seo_ai_settings", ["value"], :name => "i_seo_ai_settings_value"

  create_table "seo_ai_url_settings", :force => true do |t|
    t.integer "type_id"
    t.integer "quantity"
    t.string  "template",       :limit => 256
    t.string  "title_template", :limit => 256
  end

  add_index "seo_ai_url_settings", ["quantity"], :name => "i_seo_ai_url_settings_quantity"
  add_index "seo_ai_url_settings", ["template"], :name => "i_seo_ai_url_settings_template"
  add_index "seo_ai_url_settings", ["type_id"], :name => "i_seo_ai_url_settings_type_id"

  create_table "seo_ai_url_statistics", :id => false, :force => true do |t|
    t.integer "type_id",                 :null => false
    t.string  "url",      :limit => 256, :null => false
    t.integer "quantity"
  end

  add_index "seo_ai_url_statistics", ["quantity"], :name => "i_seo_ai_url_statistics_quantity"
  add_index "seo_ai_url_statistics", ["type_id"], :name => "i_seo_ai_url_statistics_type_id"
  add_index "seo_ai_url_statistics", ["url"], :name => "i_seo_ai_url_statistics_url"

  create_table "seo_search_criterion", :force => true do |t|
    t.integer "owner_id",                   :null => false
    t.integer "criterion_id",               :null => false
    t.string  "repres_type",  :limit => 64
    t.integer "sort_order"
  end

  add_index "seo_search_criterion", ["criterion_id"], :name => "i_seo_search_criterion_criterion_id"
  add_index "seo_search_criterion", ["owner_id"], :name => "i_seo_search_criterion_owner_id"
  add_index "seo_search_criterion", ["repres_type"], :name => "i_seo_search_criterion_repres_type"
  add_index "seo_search_criterion", ["sort_order"], :name => "i_seo_search_criterion_sort_order"

  create_table "seo_template", :force => true do |t|
    t.string  "name",       :limit => 256
    t.string  "short_name", :limit => 256
    t.text    "template"
    t.integer "entity_id"
  end

  add_index "seo_template", ["entity_id"], :name => "i_seo_template_eid"

  create_table "seo_url", :force => true do |t|
    t.integer "type_id",                                  :null => false
    t.integer "owner_id"
    t.integer "search_id"
    t.boolean "use_for_rss_catalog"
    t.boolean "use_for_zero_results"
    t.boolean "use_for_view_all_page"
    t.boolean "use_in_sitemap",        :default => false
  end

  add_index "seo_url", ["owner_id"], :name => "i_seo_url_oid"
  add_index "seo_url", ["search_id"], :name => "i_seo_url_sid"
  add_index "seo_url", ["type_id"], :name => "seo_url_type_id_key", :unique => true
  add_index "seo_url", ["use_for_rss_catalog"], :name => "i_seo_url_urss"
  add_index "seo_url", ["use_for_view_all_page"], :name => "i_seo_url_view"
  add_index "seo_url", ["use_for_zero_results"], :name => "i_seo_url_uzer"
  add_index "seo_url", ["use_in_sitemap"], :name => "i_seo_url_use_in_sitemap"

  create_table "site_map_node", :force => true do |t|
    t.integer "owner_id"
    t.string  "name",        :limit => 256
    t.string  "url_pattern", :limit => 256
    t.boolean "regexp"
    t.integer "sort_order"
  end

  add_index "site_map_node", ["name"], :name => "i_site_map_node_name"
  add_index "site_map_node", ["owner_id"], :name => "i_seo_url_owner_id"
  add_index "site_map_node", ["owner_id"], :name => "i_site_map_node_owner_id"
  add_index "site_map_node", ["sort_order"], :name => "i_site_map_node_sort_order"
  add_index "site_map_node", ["url_pattern"], :name => "i_site_map_node_url_pattern"

  create_table "source", :force => true do |t|
    t.integer  "employer_id",                 :null => false
    t.integer  "template_id"
    t.string   "name",        :limit => 256,  :null => false
    t.string   "url",         :limit => 1024, :null => false
    t.boolean  "sync",                        :null => false
    t.datetime "date"
    t.integer  "status"
    t.integer  "success"
    t.integer  "bad"
    t.boolean  "active",                      :null => false
    t.text     "log"
  end

  add_index "source", ["active"], :name => "i_source_active"
  add_index "source", ["bad"], :name => "i_source_bad"
  add_index "source", ["date"], :name => "i_source_date"
  add_index "source", ["employer_id"], :name => "i_source_employer_id"
  add_index "source", ["name"], :name => "i_source_name"
  add_index "source", ["status"], :name => "i_source_status"
  add_index "source", ["success"], :name => "i_source_success"
  add_index "source", ["sync"], :name => "i_source_sync"
  add_index "source", ["template_id"], :name => "i_source_source_template_id"
  add_index "source", ["url"], :name => "i_source_url"

  create_table "source_default_field_value", :force => true do |t|
    t.integer "source_id", :null => false
    t.integer "field_id",  :null => false
    t.text    "value",     :null => false
  end

  add_index "source_default_field_value", ["field_id"], :name => "i_source_default_field_value_field_id"
  add_index "source_default_field_value", ["source_id", "field_id"], :name => "u_fk_source_default_field_value_source_id_field_id", :unique => true
  add_index "source_default_field_value", ["source_id"], :name => "i_source_default_field_value_source_id"

  create_table "source_template", :force => true do |t|
    t.string  "name",   :limit => 256, :null => false
    t.string  "path",   :limit => 512
    t.boolean "common",                :null => false
  end

  add_index "source_template", ["common"], :name => "i_source_template_common"
  add_index "source_template", ["name"], :name => "i_source_template_name"
  add_index "source_template", ["path"], :name => "i_source_template_path"

  create_table "source_template_field", :force => true do |t|
    t.string  "path",         :limit => 1024
    t.integer "template_id",                  :null => false
    t.integer "field_id"
    t.string  "date_pattern", :limit => 128
    t.boolean "required",                     :null => false
    t.boolean "unique",                       :null => false
    t.boolean "match",                        :null => false
    t.string  "delimiter",    :limit => 128
  end

  add_index "source_template_field", ["date_pattern"], :name => "i_source_template_field_date_pattern"
  add_index "source_template_field", ["delimiter"], :name => "i_source_template_field_delimiter"
  add_index "source_template_field", ["field_id"], :name => "i_source_template_field_field_id"
  add_index "source_template_field", ["match"], :name => "i_source_template_field_match"
  add_index "source_template_field", ["path"], :name => "i_source_template_field_path"
  add_index "source_template_field", ["required"], :name => "i_source_template_field_required"
  add_index "source_template_field", ["template_id"], :name => "i_source_template_field_template_id"
  add_index "source_template_field", ["unique"], :name => "i_source_template_field_unique"

  create_table "source_template_field_matching_dictionary_item", :force => true do |t|
    t.integer "field_id",                           :null => false
    t.string  "value",              :limit => 1024, :null => false
    t.integer "dictionary_item_id"
  end

  add_index "source_template_field_matching_dictionary_item", ["dictionary_item_id"], :name => "i_source_template_field_matching_dictionary_item_dictionary_ite"
  add_index "source_template_field_matching_dictionary_item", ["field_id"], :name => "i_source_template_field_matching_dictionary_item_field_id"
  add_index "source_template_field_matching_dictionary_item", ["value", "field_id"], :name => "u_source_template_field_matching_dictionary_item_value_field_id", :unique => true
  add_index "source_template_field_matching_dictionary_item", ["value"], :name => "i_source_template_field_matching_dictionary_item_value"

  create_table "template", :force => true do |t|
    t.string  "name",        :limit => 256, :null => false
    t.text    "header"
    t.text    "css"
    t.boolean "active",                     :null => false
    t.boolean "basic",                      :null => false
    t.text    "home_header"
    t.text    "footer"
    t.text    "home_footer"
  end

  add_index "template", ["active"], :name => "i_template_act"
  add_index "template", ["basic"], :name => "i_template_bas"

  create_table "user_groups", :id => false, :force => true do |t|
    t.integer "id",                        :default => 0,  :null => false
    t.string  "name",        :limit => 64, :default => "", :null => false
    t.text    "description",                               :null => false
    t.integer "rights",      :limit => 8,                  :null => false
  end

  create_table "users", :id => false, :force => true do |t|
    t.integer "id",                     :default => 0,  :null => false
    t.string  "login",    :limit => 32, :default => "", :null => false
    t.string  "password", :limit => 32, :default => "", :null => false
    t.string  "email",    :limit => 64
    t.integer "group_id",               :default => 0,  :null => false
  end

  add_index "users", ["group_id"], :name => "i_users_gid"
  add_index "users", ["login"], :name => "users_login_key", :unique => true

end
