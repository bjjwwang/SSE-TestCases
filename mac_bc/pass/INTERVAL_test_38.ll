; ModuleID = 'mac_bc/pass/INTERVAL_test_38.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_38.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.testStruct = type { i32* }

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %s1 = alloca %struct.testStruct, align 8
  %s2 = alloca %struct.testStruct, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 -1, i32* %x, align 4, !dbg !16
  call void @llvm.dbg.declare(metadata %struct.testStruct* %s1, metadata !17, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata %struct.testStruct* %s2, metadata !23, metadata !DIExpression()), !dbg !24
  %a = getelementptr inbounds %struct.testStruct, %struct.testStruct* %s1, i32 0, i32 0, !dbg !25
  store i32* %x, i32** %a, align 8, !dbg !26
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !27
  call void @srand(i32 noundef %call), !dbg !28
  %0 = bitcast %struct.testStruct* %s2 to i8*, !dbg !29
  %1 = bitcast %struct.testStruct* %s1 to i8*, !dbg !29
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %0, i8* align 8 %1, i64 8, i1 false), !dbg !29
  %call1 = call i32 @rand(), !dbg !30
  %rem = srem i32 %call1, 10, !dbg !31
  %a2 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %s1, i32 0, i32 0, !dbg !32
  %2 = load i32*, i32** %a2, align 8, !dbg !32
  store i32 %rem, i32* %2, align 4, !dbg !33
  %a3 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %s2, i32 0, i32 0, !dbg !34
  %3 = load i32*, i32** %a3, align 8, !dbg !34
  %4 = load i32, i32* %3, align 4, !dbg !35
  %a4 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %s1, i32 0, i32 0, !dbg !36
  %5 = load i32*, i32** %a4, align 8, !dbg !36
  %6 = load i32, i32* %5, align 4, !dbg !37
  %cmp = icmp eq i32 %4, %6, !dbg !38
  br i1 %cmp, label %land.lhs.true, label %land.end, !dbg !39

land.lhs.true:                                    ; preds = %entry
  %a5 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %s2, i32 0, i32 0, !dbg !40
  %7 = load i32*, i32** %a5, align 8, !dbg !40
  %8 = load i32, i32* %7, align 4, !dbg !41
  %cmp6 = icmp sge i32 %8, 0, !dbg !42
  br i1 %cmp6, label %land.rhs, label %land.end, !dbg !43

land.rhs:                                         ; preds = %land.lhs.true
  %a7 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %s2, i32 0, i32 0, !dbg !44
  %9 = load i32*, i32** %a7, align 8, !dbg !44
  %10 = load i32, i32* %9, align 4, !dbg !45
  %cmp8 = icmp slt i32 %10, 10, !dbg !46
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %entry
  %11 = phi i1 [ false, %land.lhs.true ], [ false, %entry ], [ %cmp8, %land.rhs ], !dbg !47
  call void @svf_assert(i1 noundef zeroext %11), !dbg !48
  %12 = load i32, i32* %retval, align 4, !dbg !49
  ret i32 %12, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @srand(i32 noundef) #2

declare i32 @time(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare i32 @rand() #2

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_38.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 13, type: !11, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_38.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "x", scope: !9, file: !10, line: 14, type: !13)
!16 = !DILocation(line: 14, column: 9, scope: !9)
!17 = !DILocalVariable(name: "s1", scope: !9, file: !10, line: 15, type: !18)
!18 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "testStruct", file: !10, line: 9, size: 64, elements: !19)
!19 = !{!20}
!20 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !18, file: !10, line: 10, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!22 = !DILocation(line: 15, column: 23, scope: !9)
!23 = !DILocalVariable(name: "s2", scope: !9, file: !10, line: 16, type: !18)
!24 = !DILocation(line: 16, column: 23, scope: !9)
!25 = !DILocation(line: 17, column: 8, scope: !9)
!26 = !DILocation(line: 17, column: 10, scope: !9)
!27 = !DILocation(line: 18, column: 11, scope: !9)
!28 = !DILocation(line: 18, column: 5, scope: !9)
!29 = !DILocation(line: 19, column: 5, scope: !9)
!30 = !DILocation(line: 20, column: 15, scope: !9)
!31 = !DILocation(line: 20, column: 22, scope: !9)
!32 = !DILocation(line: 20, column: 10, scope: !9)
!33 = !DILocation(line: 20, column: 13, scope: !9)
!34 = !DILocation(line: 21, column: 21, scope: !9)
!35 = !DILocation(line: 21, column: 16, scope: !9)
!36 = !DILocation(line: 21, column: 32, scope: !9)
!37 = !DILocation(line: 21, column: 27, scope: !9)
!38 = !DILocation(line: 21, column: 24, scope: !9)
!39 = !DILocation(line: 21, column: 35, scope: !9)
!40 = !DILocation(line: 21, column: 43, scope: !9)
!41 = !DILocation(line: 21, column: 38, scope: !9)
!42 = !DILocation(line: 21, column: 46, scope: !9)
!43 = !DILocation(line: 21, column: 51, scope: !9)
!44 = !DILocation(line: 21, column: 59, scope: !9)
!45 = !DILocation(line: 21, column: 54, scope: !9)
!46 = !DILocation(line: 21, column: 61, scope: !9)
!47 = !DILocation(line: 0, scope: !9)
!48 = !DILocation(line: 21, column: 5, scope: !9)
!49 = !DILocation(line: 22, column: 1, scope: !9)
