; ModuleID = '/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/testcase_bc/general/Overrun_No_Boundary_Check_BadCase01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/general/Overrun_No_Boundary_Check_BadCase01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @TestCaseBad01() #0 !dbg !15 {
entry:
  %dst = alloca [33 x i8], align 16
  %src = alloca [33 x i8], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata [33 x i8]* %dst, metadata !19, metadata !DIExpression()), !dbg !24
  %0 = bitcast [33 x i8]* %dst to i8*, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 33, i1 false), !dbg !24
  call void @llvm.dbg.declare(metadata [33 x i8]* %src, metadata !25, metadata !DIExpression()), !dbg !26
  %1 = bitcast [33 x i8]* %src to i8*, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 33, i1 false), !dbg !26
  call void @llvm.dbg.declare(metadata i64* %i, metadata !27, metadata !DIExpression()), !dbg !33
  store i64 0, i64* %i, align 8, !dbg !34
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !37
  %arrayidx = getelementptr inbounds [33 x i8], [33 x i8]* %src, i64 0, i64 %2, !dbg !39
  %3 = load i8, i8* %arrayidx, align 1, !dbg !39
  %conv = sext i8 %3 to i32, !dbg !39
  %cmp = icmp ne i32 %conv, 0, !dbg !40
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !41

land.rhs:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !42
  %cmp2 = icmp ult i64 %4, 33, !dbg !43
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %5 = phi i1 [ false, %for.cond ], [ %cmp2, %land.rhs ], !dbg !44
  br i1 %5, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %land.end
  %6 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx4 = getelementptr inbounds [33 x i8], [33 x i8]* %src, i64 0, i64 %6, !dbg !48
  %7 = load i8, i8* %arrayidx4, align 1, !dbg !48
  %8 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx5 = getelementptr inbounds [33 x i8], [33 x i8]* %dst, i64 0, i64 %8, !dbg !50
  store i8 %7, i8* %arrayidx5, align 1, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !53
  %inc = add i64 %9, 1, !dbg !53
  store i64 %inc, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %land.end
  %10 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx6 = getelementptr inbounds [33 x i8], [33 x i8]* %dst, i64 0, i64 %10, !dbg !59
  store i8 0, i8* %arrayidx6, align 1, !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !62 {
entry:
  call void @TestCaseBad01(), !dbg !66
  ret i32 0, !dbg !67
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/general/Overrun_No_Boundary_Check_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!2 = !{!3}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !4, line: 8, baseType: !5, size: 32, elements: !6)
!4 = !DIFile(filename: "general/Overrun_No_Boundary_Check_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!7}
!7 = !DIEnumerator(name: "ARRAY_SIZE", value: 32)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"Homebrew clang version 14.0.6"}
!15 = distinct !DISubprogram(name: "TestCaseBad01", scope: !4, file: !4, line: 14, type: !16, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "dst", scope: !15, file: !4, line: 16, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 264, elements: !22)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !{!23}
!23 = !DISubrange(count: 33)
!24 = !DILocation(line: 16, column: 10, scope: !15)
!25 = !DILocalVariable(name: "src", scope: !15, file: !4, line: 17, type: !20)
!26 = !DILocation(line: 17, column: 10, scope: !15)
!27 = !DILocalVariable(name: "i", scope: !15, file: !4, line: 18, type: !28)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !29, line: 31, baseType: !30)
!29 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !31, line: 94, baseType: !32)
!31 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!32 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!33 = !DILocation(line: 18, column: 12, scope: !15)
!34 = !DILocation(line: 21, column: 12, scope: !35)
!35 = distinct !DILexicalBlock(scope: !15, file: !4, line: 21, column: 5)
!36 = !DILocation(line: 21, column: 10, scope: !35)
!37 = !DILocation(line: 21, column: 21, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !4, line: 21, column: 5)
!39 = !DILocation(line: 21, column: 17, scope: !38)
!40 = !DILocation(line: 21, column: 24, scope: !38)
!41 = !DILocation(line: 21, column: 32, scope: !38)
!42 = !DILocation(line: 21, column: 36, scope: !38)
!43 = !DILocation(line: 21, column: 38, scope: !38)
!44 = !DILocation(line: 0, scope: !38)
!45 = !DILocation(line: 21, column: 5, scope: !35)
!46 = !DILocation(line: 22, column: 22, scope: !47)
!47 = distinct !DILexicalBlock(scope: !38, file: !4, line: 21, column: 64)
!48 = !DILocation(line: 22, column: 18, scope: !47)
!49 = !DILocation(line: 22, column: 13, scope: !47)
!50 = !DILocation(line: 22, column: 9, scope: !47)
!51 = !DILocation(line: 22, column: 16, scope: !47)
!52 = !DILocation(line: 23, column: 5, scope: !47)
!53 = !DILocation(line: 21, column: 59, scope: !38)
!54 = !DILocation(line: 21, column: 5, scope: !38)
!55 = distinct !{!55, !45, !56, !57}
!56 = !DILocation(line: 23, column: 5, scope: !35)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 26, column: 9, scope: !15)
!59 = !DILocation(line: 26, column: 5, scope: !15)
!60 = !DILocation(line: 26, column: 12, scope: !15)
!61 = !DILocation(line: 27, column: 1, scope: !15)
!62 = distinct !DISubprogram(name: "main", scope: !4, file: !4, line: 29, type: !63, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!63 = !DISubroutineType(types: !64)
!64 = !{!65}
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DILocation(line: 30, column: 5, scope: !62)
!67 = !DILocation(line: 31, column: 1, scope: !62)
