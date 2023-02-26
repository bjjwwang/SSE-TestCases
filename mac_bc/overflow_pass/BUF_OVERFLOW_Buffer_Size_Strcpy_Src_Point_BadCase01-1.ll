; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Buffer_Size_Strcpy_Src_Point_BadCase01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Buffer_Size_Strcpy_Src_Point_BadCase01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [13 x i8] c"hello world!\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %dest = alloca [10 x i8], align 1
  %src = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata [10 x i8]* %dest, metadata !15, metadata !DIExpression()), !dbg !20
  %0 = bitcast [10 x i8]* %dest to i8*, !dbg !20
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 0, i64 10, i1 false), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %src, metadata !21, metadata !DIExpression()), !dbg !23
  store i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), i8** %src, align 8, !dbg !23
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dest, i64 0, i64 0, !dbg !24
  %1 = load i8*, i8** %src, align 8, !dbg !24
  %call = call i8* @__strcpy_chk(i8* noundef %arraydecay, i8* noundef %1, i64 noundef 10) #4, !dbg !24
  ret i32 0, !dbg !25
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strcpy_chk(i8* noundef, i8* noundef, i64 noundef) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Buffer_Size_Strcpy_Src_Point_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 8, type: !11, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Buffer_Size_Strcpy_Src_Point_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "dest", scope: !9, file: !10, line: 10, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 80, elements: !18)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !{!19}
!19 = !DISubrange(count: 10)
!20 = !DILocation(line: 10, column: 10, scope: !9)
!21 = !DILocalVariable(name: "src", scope: !9, file: !10, line: 11, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!23 = !DILocation(line: 11, column: 11, scope: !9)
!24 = !DILocation(line: 13, column: 5, scope: !9)
!25 = !DILocation(line: 14, column: 1, scope: !9)
