; ModuleID = '/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/testcase_bc/function/String_Size_Strcpy_SrcOverflow_BadCase06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/function/String_Size_Strcpy_SrcOverflow_BadCase06-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.TestCaseBad06.addr = private unnamed_addr constant [11 x i8] c"0x7f000001\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @TestCaseBad06() #0 !dbg !9 {
entry:
  %tempDst = alloca [10 x i8], align 1
  %addr = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata [10 x i8]* %tempDst, metadata !14, metadata !DIExpression()), !dbg !19
  %0 = bitcast [10 x i8]* %tempDst to i8*, !dbg !19
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 10, i1 false), !dbg !19
  call void @llvm.dbg.declare(metadata [11 x i8]* %addr, metadata !20, metadata !DIExpression()), !dbg !24
  %1 = bitcast [11 x i8]* %addr to i8*, !dbg !24
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.TestCaseBad06.addr, i32 0, i32 0), i64 11, i1 false), !dbg !24
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %tempDst, i64 0, i64 0, !dbg !25
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %addr, i64 0, i64 0, !dbg !25
  %call = call i8* @__strcpy_chk(i8* noundef %arraydecay, i8* noundef %arraydecay1, i64 noundef 10) #5, !dbg !25
  ret void, !dbg !26
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__strcpy_chk(i8* noundef, i8* noundef, i64 noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !27 {
entry:
  call void @TestCaseBad06(), !dbg !31
  ret i32 0, !dbg !32
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/function/String_Size_Strcpy_SrcOverflow_BadCase06-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "TestCaseBad06", scope: !10, file: !10, line: 12, type: !11, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!10 = !DIFile(filename: "function/String_Size_Strcpy_SrcOverflow_BadCase06-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !{}
!14 = !DILocalVariable(name: "tempDst", scope: !9, file: !10, line: 14, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 80, elements: !17)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{!18}
!18 = !DISubrange(count: 10)
!19 = !DILocation(line: 14, column: 10, scope: !9)
!20 = !DILocalVariable(name: "addr", scope: !9, file: !10, line: 15, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 88, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 11)
!24 = !DILocation(line: 15, column: 7, scope: !9)
!25 = !DILocation(line: 18, column: 5, scope: !9)
!26 = !DILocation(line: 19, column: 1, scope: !9)
!27 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 21, type: !28, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!28 = !DISubroutineType(types: !29)
!29 = !{!30}
!30 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!31 = !DILocation(line: 22, column: 5, scope: !27)
!32 = !DILocation(line: 23, column: 1, scope: !27)
