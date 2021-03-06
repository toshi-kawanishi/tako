module Tako
  module ActiveRecordExt
    module CollectionProxy
      def self.included(mod)
        mod.extend(ShardedMethods)
        mod.sharded_methods :any?,
                            :build,
                            :count,
                            :create,
                            :create!,
                            :concat,
                            :delete,
                            :delete_all,
                            :destroy,
                            :destroy_all,
                            :empty?,
                            :find,
                            :first,
                            :include?,
                            :last,
                            :length,
                            :many?,
                            :pluck,
                            :replace,
                            :select,
                            :size,
                            :sum,
                            :to_a,
                            :uniq
      end

      def current_shard
        @association.owner.current_shard
      end
    end
  end
end

ActiveRecord::Associations::CollectionProxy.class_eval do
  include Tako::ActiveRecordExt::CollectionProxy
end
