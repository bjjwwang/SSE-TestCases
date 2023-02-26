; ModuleID = 'mac_bc/pass/cwe126_char_alloc.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/cwe126_char_alloc.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !12 {
entry:
  %data = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [2 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 2, align 16, !dbg !22
  store i8* %0, i8** %dataGoodBuffer, align 8, !dbg !21
  %1 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !23
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !23
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !23
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 2, i64 noundef %3) #5, !dbg !23
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !24
  store i8* %4, i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [2 x i8]* %dest, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [2 x i8], [2 x i8]* %dest, i64 0, i64 0, !dbg !31
  %5 = load i8*, i8** %data, align 8, !dbg !31
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %arraydecay, i8* align 1 %5, i64 2, i1 false), !dbg !31
  %6 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 0, !dbg !32
  %7 = load i8, i8* %arrayidx, align 1, !dbg !32
  %conv = sext i8 %7 to i32, !dbg !32
  %cmp = icmp eq i32 %conv, 65, !dbg !33
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !34
  ret i32 0, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare void @svf_assert(i1 noundef zeroext) #4

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/cwe126_char_alloc.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"PIC Level", i32 2}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"Homebrew clang version 14.0.6"}
!12 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 13, type: !14, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!13 = !DIFile(filename: "src/pass/cwe126_char_alloc.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{!16}
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !12, file: !13, line: 14, type: !3)
!19 = !DILocation(line: 14, column: 12, scope: !12)
!20 = !DILocalVariable(name: "dataGoodBuffer", scope: !12, file: !13, line: 15, type: !3)
!21 = !DILocation(line: 15, column: 12, scope: !12)
!22 = !DILocation(line: 15, column: 37, scope: !12)
!23 = !DILocation(line: 16, column: 5, scope: !12)
!24 = !DILocation(line: 18, column: 12, scope: !12)
!25 = !DILocation(line: 18, column: 10, scope: !12)
!26 = !DILocalVariable(name: "dest", scope: !12, file: !13, line: 19, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 16, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 2)
!30 = !DILocation(line: 19, column: 10, scope: !12)
!31 = !DILocation(line: 20, column: 5, scope: !12)
!32 = !DILocation(line: 21, column: 16, scope: !12)
!33 = !DILocation(line: 21, column: 24, scope: !12)
!34 = !DILocation(line: 21, column: 5, scope: !12)
!35 = !DILocation(line: 22, column: 1, scope: !12)
