; ModuleID = 'linux_bc/pass/cwe121_struct_alloc.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/cwe121_struct_alloc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !18 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 32, align 16, !dbg !25
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !26
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !24
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !27
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %data, align 8, !dbg !28
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !29
  %arrayidx = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %3, i64 0, !dbg !29
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !30
  store i32 10, i32* %intOne, align 4, !dbg !31
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !32
  %arrayidx1 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %4, i64 1, !dbg !32
  %intOne2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 0, !dbg !33
  store i32 11, i32* %intOne2, align 4, !dbg !34
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !35
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 2, !dbg !35
  %intOne4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 0, !dbg !36
  store i32 12, i32* %intOne4, align 4, !dbg !37
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !38
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 1, !dbg !38
  %intOne6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 0, !dbg !39
  %7 = load i32, i32* %intOne6, align 4, !dbg !39
  %cmp = icmp eq i32 %7, 11, !dbg !40
  call void @svf_assert(i1 zeroext %cmp), !dbg !41
  ret i32 0, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/cwe121_struct_alloc.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 11, baseType: !7)
!6 = !DIFile(filename: "src/pass/cwe121_struct_alloc.c", directory: "/home/SVF-tools/SSE-TestCases")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !6, line: 7, size: 64, elements: !8)
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !7, file: !6, line: 9, baseType: !10, size: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !7, file: !6, line: 10, baseType: !10, size: 32, offset: 32)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 13, type: !19, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!10}
!21 = !DILocalVariable(name: "data", scope: !18, file: !6, line: 14, type: !4)
!22 = !DILocation(line: 14, column: 21, scope: !18)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !6, line: 15, type: !4)
!24 = !DILocation(line: 15, column: 21, scope: !18)
!25 = !DILocation(line: 15, column: 54, scope: !18)
!26 = !DILocation(line: 15, column: 37, scope: !18)
!27 = !DILocation(line: 18, column: 12, scope: !18)
!28 = !DILocation(line: 18, column: 10, scope: !18)
!29 = !DILocation(line: 19, column: 5, scope: !18)
!30 = !DILocation(line: 19, column: 13, scope: !18)
!31 = !DILocation(line: 19, column: 20, scope: !18)
!32 = !DILocation(line: 20, column: 5, scope: !18)
!33 = !DILocation(line: 20, column: 13, scope: !18)
!34 = !DILocation(line: 20, column: 20, scope: !18)
!35 = !DILocation(line: 21, column: 5, scope: !18)
!36 = !DILocation(line: 21, column: 13, scope: !18)
!37 = !DILocation(line: 21, column: 20, scope: !18)
!38 = !DILocation(line: 22, column: 16, scope: !18)
!39 = !DILocation(line: 22, column: 24, scope: !18)
!40 = !DILocation(line: 22, column: 31, scope: !18)
!41 = !DILocation(line: 22, column: 5, scope: !18)
!42 = !DILocation(line: 23, column: 1, scope: !18)
