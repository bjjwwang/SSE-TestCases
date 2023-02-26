; ModuleID = 'mac_bc/pass/BASIC_cstring_cmp_0.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_cstring_cmp_0.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.main.name = private unnamed_addr constant [10 x i8] c"svf\00\00\00\00\00\00\00", align 1
@__const.main.name2 = private unnamed_addr constant [10 x i8] c"sse\00\00\00\00\00\00\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %name = alloca [10 x i8], align 1
  %len = alloca i32, align 4
  %name2 = alloca [10 x i8], align 1
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [10 x i8]* %name, metadata !15, metadata !DIExpression()), !dbg !20
  %0 = bitcast [10 x i8]* %name to i8*, !dbg !20
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([10 x i8], [10 x i8]* @__const.main.name, i32 0, i32 0), i64 10, i1 false), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %len, metadata !21, metadata !DIExpression()), !dbg !22
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %name, i64 0, i64 0, !dbg !23
  %call = call i64 @strlen(i8* noundef %arraydecay), !dbg !24
  %conv = trunc i64 %call to i32, !dbg !24
  store i32 %conv, i32* %len, align 4, !dbg !22
  %1 = load i32, i32* %len, align 4, !dbg !25
  %cmp = icmp eq i32 %1, 3, !dbg !26
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !27
  call void @llvm.dbg.declare(metadata [10 x i8]* %name2, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = bitcast [10 x i8]* %name2 to i8*, !dbg !29
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([10 x i8], [10 x i8]* @__const.main.name2, i32 0, i32 0), i64 10, i1 false), !dbg !29
  %arraydecay2 = getelementptr inbounds [10 x i8], [10 x i8]* %name, i64 0, i64 0, !dbg !30
  %arraydecay3 = getelementptr inbounds [10 x i8], [10 x i8]* %name2, i64 0, i64 0, !dbg !31
  %call4 = call i32 @strcmp(i8* noundef %arraydecay2, i8* noundef %arraydecay3), !dbg !32
  %tobool = icmp ne i32 %call4, 0, !dbg !32
  call void @svf_assert(i1 noundef zeroext %tobool), !dbg !33
  ret i32 0, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i64 @strlen(i8* noundef) #3

declare void @svf_assert(i1 noundef zeroext) #3

declare i32 @strcmp(i8* noundef, i8* noundef) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_cstring_cmp_0.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 9, type: !11, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/BASIC_cstring_cmp_0.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "name", scope: !9, file: !10, line: 10, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 80, elements: !18)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !{!19}
!19 = !DISubrange(count: 10)
!20 = !DILocation(line: 10, column: 10, scope: !9)
!21 = !DILocalVariable(name: "len", scope: !9, file: !10, line: 11, type: !13)
!22 = !DILocation(line: 11, column: 9, scope: !9)
!23 = !DILocation(line: 11, column: 22, scope: !9)
!24 = !DILocation(line: 11, column: 15, scope: !9)
!25 = !DILocation(line: 12, column: 16, scope: !9)
!26 = !DILocation(line: 12, column: 20, scope: !9)
!27 = !DILocation(line: 12, column: 5, scope: !9)
!28 = !DILocalVariable(name: "name2", scope: !9, file: !10, line: 14, type: !16)
!29 = !DILocation(line: 14, column: 10, scope: !9)
!30 = !DILocation(line: 15, column: 23, scope: !9)
!31 = !DILocation(line: 15, column: 29, scope: !9)
!32 = !DILocation(line: 15, column: 16, scope: !9)
!33 = !DILocation(line: 15, column: 5, scope: !9)
!34 = !DILocation(line: 16, column: 5, scope: !9)
